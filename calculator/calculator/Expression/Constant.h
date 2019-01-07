//
//  Constant.h
//  calculator
//
//  Created by Rudrik on 04/01/19.
//

#import <Foundation/Foundation.h>
#import "Enumerations.h"

@interface Constant : NSObject
{
	PrimitiveDataType DataType;
	NSString *Value;
}

@property (nonatomic) PrimitiveDataType DataType;
@property (nonatomic, retain) NSString *Value;

- (Constant*)init;

@end
