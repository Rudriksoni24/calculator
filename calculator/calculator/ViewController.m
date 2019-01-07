//
//  ViewController.m
//  calculator
//
//  Created by Rudrik on 03/01/19.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize displayTextField;

- (void)didReceiveMemoryWarning
{
    //Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    expressionFinished = FALSE;
}

- (IBAction)Clear_Click:(id)sender
{
    displayTextField.text = @"";
}

- (IBAction)Backspace_Click:(id)sender
{
    if ([displayTextField.text length] > 0)
    {
        displayTextField.text = [displayTextField.text substringToIndex:([displayTextField.text length] - 1)];
    }
}

- (IBAction)Number_Click:(id)sender
{
    UIButton *senderButton = (UIButton*)sender;
    [self addChar:senderButton.currentTitle];
}

- (IBAction)Dot_Click:(id)sender
{
    [self addChar:@"."];
}

- (IBAction)Plus_Click:(id)sender
{
    [self addChar:@"+"];
}

- (IBAction)Minus_Click:(id)sender
{
    [self addChar:@"-"];
}

- (IBAction)Multiply_Click:(id)sender
{
    [self addChar:@"*"];
}

- (IBAction)Divide_Click:(id)sender
{
    [self addChar:@"/"];
}

- (IBAction)Modulus_Click:(id)sender
{
    [self addChar:@"%"];
}

- (IBAction)Power_Click:(id)sender
{
    [self addChar:@"^"];
}

- (IBAction)OpenParenthesis_Click:(id)sender
{
    [self addChar:@"("];
}

- (IBAction)CloseParenthesis_Click:(id)sender
{
    [self addChar:@")"];
}

- (IBAction)Equals_Click:(id)sender
{
    ExpressionResult *result = [ExpressionValidator Validate:displayTextField.text];
    
    if (result.IsError == FALSE)
    {
        NSString *inputExpression = [NSString stringWithFormat:@"%@", displayTextField.text];
        
        //evaluate the expression
        double res = [ExpressionEvaluator Evaluate:result.PostfixTokens];
        NSString *resText = [NSString stringWithFormat:@"%.4lf", res];
        
        if ([resText rangeOfString:@"."].location != NSNotFound)
        {
            while ([resText hasSuffix:@"0"])
            {
                resText = [resText substringToIndex:resText.length - 1];
            }
            
            if ([resText hasSuffix:@"."])
            {
                resText = [resText substringToIndex:resText.length - 1];
            }
        }
        displayTextField.text = resText;
        expressionFinished = TRUE;
    }
}
- (void)addChar:(NSString*)str
{
    if (expressionFinished)
    {
        if ([self isOperator:str] == FALSE)
        {
            displayTextField.text = str;
            expressionFinished = FALSE;
            return;
        }
    }
    
    displayTextField.text = [displayTextField.text stringByAppendingString:str];
    expressionFinished = FALSE;
}

- (BOOL)isOperator:(NSString*)op
{
    NSString *allOperators = @"+-*/%^";
    return ([allOperators rangeOfString:op].location != NSNotFound);
}

@end
