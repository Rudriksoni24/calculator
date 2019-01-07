//
//  ViewController.h
//  calculator
//
//  Created by Rudrik on 03/01/19.
//

#import <UIKit/UIKit.h>
#import "Enumerations.h"
#import "ExpressionParser.h"
#import "ExpressionEvaluator.h"
#import "ExpressionValidator.h"

@interface ViewController : UIViewController
{
    UITextField *displayTextField;
    bool expressionFinished;
}

@property (nonatomic, retain) IBOutlet UITextField *displayTextField;


- (IBAction)Clear_Click:(id)sender;
- (IBAction)Backspace_Click:(id)sender;
- (IBAction)Number_Click:(id)sender;
- (IBAction)Dot_Click:(id)sender;
- (IBAction)Plus_Click:(id)sender;
- (IBAction)Minus_Click:(id)sender;
- (IBAction)Multiply_Click:(id)sender;
- (IBAction)Divide_Click:(id)sender;
- (IBAction)Modulus_Click:(id)sender;
- (IBAction)Power_Click:(id)sender;
- (IBAction)OpenParenthesis_Click:(id)sender;
- (IBAction)CloseParenthesis_Click:(id)sender;
- (IBAction)Equals_Click:(id)sender;


- (void)addChar:(NSString*)str;
- (BOOL)isOperator:(NSString*)str;


@end
