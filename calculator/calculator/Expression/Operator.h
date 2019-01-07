 //
 //  Operator.h
 //  calculator
 //
 //  Created by Rudrik on 04/01/19.
 //

#import <Foundation/Foundation.h>
#import "Enumerations.h"

@interface Operator : NSObject
{
	OperatorSymbol Symbol;
	NSString *SymbolText;
	int OperandCount;
	int PrecedenceLevel;
	OperatorAssociativity Associativity;
}

@property (nonatomic) OperatorSymbol Symbol;
@property (nonatomic, retain) NSString *SymbolText;
@property (nonatomic) int OperandCount;
@property (nonatomic) int PrecedenceLevel;
@property (nonatomic) OperatorAssociativity Associativity;

- (Operator*)init;
- (Operator*)initWithValues:(OperatorSymbol)symbol: (NSString*)symbolText: (int)operandCount: (int)precedenceLevel: (OperatorAssociativity)associativity;

+ (OperatorSymbol)ParseOperatorSymbol:(char)c;
+ (Operator*)GetOperatorBySymbol:(OperatorSymbol)symbol;
+ (Operator*)GetOperatorBySymbolText:(char)c;

@end
