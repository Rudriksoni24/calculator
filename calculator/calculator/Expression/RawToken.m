//
//  RawToken.m
//  calculator
//
//  Created by Rudrik on 04/01/19.
//

#include "RawToken.h"

@implementation RawToken

@synthesize Type;
@synthesize LinearToken;
@synthesize Index;

- (RawToken*)init
{
	self = [super init];
	
	if(self)
	{
		Type = EmptyTokenType;
		LinearToken = @"";
		Index = -1;
	}

	return(self);
}

@end
