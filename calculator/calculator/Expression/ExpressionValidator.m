//
//  ExpressionValidator.m
//  calculator
//
//  Created by Rudrik on 04/01/19.
//

#import "ExpressionValidator.h"

@implementation ExpressionValidator

+(ExpressionResult*)Validate:(NSString*)expression
{
    NSMutableArray *inputTokens = [ExpressionParser Parse:expression];

    for (int i = 0; i < [inputTokens count]; i++)
    {
        RawToken *token = [inputTokens objectAtIndex:i];
        token.Index = i;
    }

    NSMutableArray *postfixStack = [[NSMutableArray alloc] init];
    NSMutableArray *postfixTokens = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < [inputTokens count]; i++)
    {
        RawToken *token = [inputTokens objectAtIndex:i];
        
        if (token.Type == ConstantToken)
        {
            [postfixTokens addObject:token];
        }
        else if(token.Type == OperatorToken)
        {
            if ([ExpressionUtility IsOpenParenthesis:token])
            {
                [postfixStack addObject:token];
            }
            else if ([ExpressionUtility IsCloseParenthesis:token])
            {
                while (TRUE)
                {
                    if ([postfixStack count] == 0)
                    {
                        ExpressionResult *result = [[ExpressionResult alloc] init];
                        result.PostfixTokens = postfixTokens;
                        result.IsError = TRUE;
                        result.ErrorTokenIndex = token.Index;
                        result.ErrorMessage = @"Mismatched Parenthesis.";
                        return(result);
                    }
                    
                    RawToken *top = [postfixStack lastObject];
                    [postfixStack removeLastObject];
                    
                    if ([ExpressionUtility IsOpenParenthesis:top])
                    {
                        break;
                    }
                    else
                    {
                        [postfixTokens addObject:top];
                    }
                }
            }
            else
            {
                Operator *op1 = [Operator GetOperatorBySymbolText:[token.LinearToken characterAtIndex:0]];
                
                while (TRUE)
                {
                    if ([postfixStack count] == 0)
                    {
                        break;
                    }
                    
                    RawToken *top = [postfixStack lastObject];
                    if ([ExpressionUtility IsArithmeticOperator:top])
                    {
                        BOOL readyToPopOperator2 = FALSE;
                        Operator *op2 = [Operator GetOperatorBySymbolText:[top.LinearToken characterAtIndex:0]];
                        
                        if (op1.Associativity == LeftToRight && op1.PrecedenceLevel >= op2.PrecedenceLevel)
                        {
                            readyToPopOperator2 = TRUE;
                        }
                        else if((op1.Associativity = RightToLeft && op1.PrecedenceLevel > op2.PrecedenceLevel))
                        {
                            readyToPopOperator2 = TRUE;
                        }
                        
                        if (readyToPopOperator2)
                        {
                            [postfixStack removeLastObject];
                            [postfixTokens addObject:top];
                        }
                        else
                        {
                            break;
                        }
                    }
                    else
                    {
                        break;
                    }
                }
                
                [postfixStack addObject:token];
            }
        }
    }
    
    //pop entire stack to output
    while ([postfixStack count] > 0)
    {
        RawToken *top = [postfixStack lastObject];
        [postfixStack removeLastObject];
        
        if ([ExpressionUtility IsOpenParenthesis:top] || [ExpressionUtility IsCloseParenthesis:top])
        {
            ExpressionResult *result = [[ExpressionResult alloc] init];
            result.PostfixTokens = postfixTokens;
            result.IsError = TRUE;
            result.ErrorTokenIndex = top.Index;
            result.ErrorMessage = @"Mismatched Parenthesis.";
            return(result);
        }
        else
        {
            [postfixTokens addObject:top];
        }
    }
    
    NSMutableArray *evaluateStack = [[NSMutableArray alloc] init];
    
    for (int index = 0; index < [postfixTokens count]; index += 1)
    {
        RawToken *token = [postfixTokens objectAtIndex:index];
        
        if (token.Type == ConstantToken)
        {
            [evaluateStack addObject:token];
        }
        else if(token.Type == OperatorToken)
        {
            if ([evaluateStack count] >= 2)
            {
                [evaluateStack removeLastObject];
                [evaluateStack removeLastObject];
                
                RawToken *dummyResultToken = [ExpressionUtility CreateNumberConstantToken:@"1"];
                [evaluateStack addObject:dummyResultToken];
            }
            else
            {
                ExpressionResult *result = [[ExpressionResult alloc] init];
                result.PostfixTokens = postfixTokens;
                result.IsError = TRUE;
                result.ErrorTokenIndex = token.Index;
                result.ErrorMessage = @"Missing Operand for Operator.";
                return(result);
            }
            
        }
    }
    
    if ([evaluateStack count] == 1)
    {
        ExpressionResult *result = [[ExpressionResult alloc] init];
        result.PostfixTokens = postfixTokens;
        result.IsError = FALSE;
        result.ErrorTokenIndex = -1;
        result.ErrorMessage = @"";
        return(result);
    }
    else
    {
        ExpressionResult *result = [[ExpressionResult alloc] init];
        result.PostfixTokens = postfixTokens;
        result.IsError = TRUE;
        result.ErrorTokenIndex = [inputTokens count] - 1;
        result.ErrorMessage = @"Incomplete Expression.";
        return(result);
    }
}
@end
