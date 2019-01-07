//
//  Operator.m
//  calculator
//
//  Created by Rudrik on 04/01/19.
//

#include "Operator.h"

@implementation Operator

@synthesize Symbol;
@synthesize SymbolText;
@synthesize OperandCount;
@synthesize PrecedenceLevel;
@synthesize Associativity;

- (Operator*)init
{
	self = [super init];
	
	if(self)
	{
		Symbol = EmptyOperatorSymbol;
		SymbolText = @"";
		OperandCount = 0;
		PrecedenceLevel = -1;
		Associativity = EmptyOperatorAssociativity;
	}
	
	return(self);
}

- (Operator*)initWithValues:(OperatorSymbol)symbol: (NSString*)symbolText: (int)operandCount: (int)precedenceLevel: (OperatorAssociativity)associativity;
{
	self = [super init];
	
	if(self)
	{
		self.Symbol = symbol;
		self.SymbolText = symbolText;
		self.OperandCount = operandCount;
		self.PrecedenceLevel = precedenceLevel;
		self.Associativity = associativity;
	}
	
	return(self);
}

+ (OperatorSymbol)ParseOperatorSymbol:(char)c
{
	switch (c)
	{
		case '+':
			return(Plus);
		case '-':
			return(Minus);
		case '*':
			return(Multiply);
		case '/':
			return(Divide);
		case '%':
			return(Modulus);
		case '^':
			return(Power);
		case '(':
			return(OpenParenthesis);
		case ')':
			return(CloseParenthesis);
		default:
			return(EmptyOperatorSymbol);
	}
}

+ (Operator*)GetOperatorBySymbol:(OperatorSymbol)symbol
{
	if(symbol == Plus)
	{
		Operator *op = [[Operator alloc] init];
		op.Symbol = Plus;
		op.SymbolText = @"+";
		op.OperandCount = 2;
		op.PrecedenceLevel = 4;
		op.Associativity = LeftToRight;
		return(op);
	}
	else if(symbol == Minus)
	{
		Operator *op = [[Operator alloc] init];
		op.Symbol = Minus;
		op.SymbolText = @"-";
		op.OperandCount = 2;
		op.PrecedenceLevel = 4;
		op.Associativity = LeftToRight;
		return(op);
	}
	else if(symbol == Multiply)
	{
		Operator *op = [[Operator alloc] init];
		op.Symbol = Multiply;
		op.SymbolText = @"*";
		op.OperandCount = 2;
		op.PrecedenceLevel = 3;
		op.Associativity = LeftToRight;
		return(op);
	}
	else if(symbol == Divide)
	{
		Operator *op = [[Operator alloc] init];
		op.Symbol = Divide;
		op.SymbolText = @"/";
		op.OperandCount = 2;
		op.PrecedenceLevel = 3;
		op.Associativity = LeftToRight;
		return(op);
	}
	else if(symbol == Modulus)
	{
		Operator *op = [[Operator alloc] init];
		op.Symbol = Modulus;
		op.SymbolText = @"%";
		op.OperandCount = 2;
		op.PrecedenceLevel = 3;
		op.Associativity = LeftToRight;
		return(op);
	}
	else if(symbol == Power)
	{
		Operator *op = [[Operator alloc] init];
		op.Symbol = Power;
		op.SymbolText = @"^";
		op.OperandCount = 2;
		op.PrecedenceLevel = 2;
		op.Associativity = RightToLeft;
		return(op);
	}
	else if(symbol == OpenParenthesis)
	{
		Operator *op = [[Operator alloc] init];
		op.Symbol = OpenParenthesis;
		op.SymbolText = @"(";
		return(op);
	}
	else if(symbol == CloseParenthesis)
	{
		Operator *op = [[Operator alloc] init];
		op.Symbol = CloseParenthesis;
		op.SymbolText = @")";
		return(op);
	}
	
	return(nil);
}

+ (Operator*)GetOperatorBySymbolText:(char)c
{
	OperatorSymbol symbol = [Operator ParseOperatorSymbol:c];
	return([Operator GetOperatorBySymbol:symbol]);
}

@end
