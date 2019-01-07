//
//  ExpressionEvaluator.m
//  calculator
//
//  Created by Rudrik on 04/01/19.
//

#include "ExpressionEvaluator.h"

@implementation ExpressionEvaluator

+ (double)Evaluate:(NSMutableArray*)postfixTokens
{
	NSMutableArray *stack = [[NSMutableArray alloc] init];

	for(int index = 0; index < [postfixTokens count]; index+=1)
	{
		RawToken *token = [postfixTokens objectAtIndex:index];
		
		if(token.Type == ConstantToken)
		{
			[stack addObject:token];
		}
		else if(token.Type == OperatorToken)
		{
			RawToken *temp = [stack lastObject];
			[stack removeLastObject];
			RawToken *top = [stack lastObject];
			[stack removeLastObject];
			
			RawToken *resultToken = [ExpressionEvaluator EvaluateArithmetic:top with:temp op:token];
			[stack addObject:resultToken];
		}
	}
	if([stack count] == 1)
	{
		RawToken *top = [stack lastObject];
		double result = [top.LinearToken doubleValue];
		return(result);
	}
	
	return(0.0);
}

+ (RawToken*)EvaluateArithmetic:(RawToken *)token1 with:(RawToken *)token2 op:(RawToken *)op
{
	OperatorSymbol operatorSymbol = [Operator ParseOperatorSymbol:[op.LinearToken characterAtIndex:0]];
	double number1 = [token1.LinearToken doubleValue];
	double number2 = [token2.LinearToken doubleValue];
	
	double result = 0.0;
	switch (operatorSymbol)
	{
		case Plus:
			result = number1 + number2;
			break;
		case Minus:
			result = number1 - number2;
			break;
		case Multiply:
			result = number1 * number2;
			break;
		case Divide:
			result = number1 / number2;
			break;
		case Modulus:
			result = (int)number1 % (int)number2;
			break;
		case Power:
			result = pow(number1, number2);
			break;
		default:
			result = 0.0;
	}
	
	RawToken *resultToken = [[RawToken alloc] init];
	resultToken.Type = ConstantToken;
	resultToken.LinearToken = [NSString stringWithFormat:@"%lf", result];
	return(resultToken);
}

@end
