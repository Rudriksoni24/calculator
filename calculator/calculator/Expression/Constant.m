//
//  Constant.m
//  calculator
//
//  Created by Rudrik on 04/01/19.
//

#include "Constant.h"

@implementation Constant

@synthesize DataType;
@synthesize Value;

- (Constant*)init
{
	self = [super init];
	
	if(self)
	{
		DataType = EmptyPrimitiveDataType;
		Value = @"";
	}
	
	return(self);
}

@end
