//
//  ExpressionResult.h
//  calculator
//
//  Created by Rudrik on 04/01/19.
//

#import <Foundation/Foundation.h>

@interface ExpressionResult : NSObject
{
	NSMutableArray *PostfixTokens;
	BOOL IsError;
	int ErrorTokenIndex;
	NSString *ErrorMessage;
}

@property (nonatomic, retain) NSMutableArray *PostfixTokens;
@property (nonatomic) BOOL IsError;
@property (nonatomic) int ErrorTokenIndex;
@property (nonatomic, retain) NSString *ErrorMessage;

@end
