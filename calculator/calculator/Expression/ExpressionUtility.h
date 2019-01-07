//
//  ExpressionUtility.h
//  calculator
//
//  Created by Rudrik on 04/01/19.
//

#import <Foundation/Foundation.h>
#import "Enumerations.h"
#import "RawToken.h"
#import "Constant.h"
#import "Operator.h"

@interface ExpressionUtility : NSObject
{
}

+ (BOOL)IsDigit:(char)c;
+ (BOOL)IsOpenParenthesis:(RawToken*)token;
+ (BOOL)IsCloseParenthesis:(RawToken*)token;
+ (BOOL)IsArithmeticOperator:(RawToken*)token;
+ (RawToken*)CreateOperatorToken:(char)c;
+ (RawToken*)CreateNumberConstantToken:(NSString*)str;

@end
