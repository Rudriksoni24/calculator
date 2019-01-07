//
//  ExpressionEvaluator.h
//  calculator
//
//  Created by Rudrik on 04/01/19.
//

#import <Foundation/Foundation.h>
#import "Enumerations.h"
#import "RawToken.h"
#import "Constant.h"
#import "Operator.h"
#import "ExpressionUtility.h"

@interface ExpressionEvaluator : NSObject
{
}

+ (double)Evaluate:(NSMutableArray*)postfixTokens;
+ (RawToken*)EvaluateArithmetic:(RawToken*)token1 with:(RawToken*)token2 op:(RawToken*)op;

@end
