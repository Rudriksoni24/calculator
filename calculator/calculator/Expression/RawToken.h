//
//  RawToken.h
//  calculator
//
//  Created by Rudrik on 04/01/19.
//

#import <Foundation/Foundation.h>
#import "Enumerations.h"

@interface RawToken : NSObject
{
	TokenType Type;
	NSString *LinearToken;
	int Index;
}

@property (nonatomic) TokenType Type;
@property (nonatomic, retain) NSString *LinearToken;
@property (nonatomic) int Index;

- (RawToken*)init;

@end
