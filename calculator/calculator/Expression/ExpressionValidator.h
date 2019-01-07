//
//  ExpressionValidator.h
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
#import "ExpressionParser.h"
#import "ExpressionResult.h"

NS_ASSUME_NONNULL_BEGIN

@interface ExpressionValidator : NSObject
+(ExpressionResult*)Validate:(NSString*)expression;
@end

NS_ASSUME_NONNULL_END
