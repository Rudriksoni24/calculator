//
//  ExpressionUtility.m
//  calculator
//
//  Created by Rudrik on 04/01/19.
//

#include "ExpressionUtility.h"

@implementation ExpressionUtility

+ (BOOL)IsDigit:(char)c
{
	switch (c)
	{
		case '1':
		case '2':
		case '3':
		case '4':
		case '5':
		case '6':
		case '7':
		case '8':
		case '9':
		case '0':
		case '.':
			return(TRUE);
		default:
			return(FALSE);
	}
}

+ (BOOL)IsOpenParenthesis:(RawToken*)token
{
	if (token.Type == OperatorToken)
	{
		OperatorSymbol symbol = [Operator ParseOperatorSymbol:[token.LinearToken characterAtIndex:0]];
		return(symbol == OpenParenthesis);
	}
	
	return(FALSE);
}

+ (BOOL)IsCloseParenthesis:(RawToken*)token
{
	if (token.Type == OperatorToken)
	{
		OperatorSymbol symbol = [Operator ParseOperatorSymbol:[token.LinearToken characterAtIndex:0]];
		return(symbol == CloseParenthesis);
	}
	
	return(FALSE);
}

+ (BOOL)IsArithmeticOperator:(RawToken*)token
{
	return(token.Type == OperatorToken && ![self IsOpenParenthesis:token] && ![self IsCloseParenthesis:token]);
}

+ (RawToken*)CreateOperatorToken:(char)c
{
	OperatorSymbol symbol = [Operator ParseOperatorSymbol:c];
	if(symbol == EmptyOperatorSymbol)
	{
		return(nil);
	}
	else
	{
		Operator *op = [Operator GetOperatorBySymbol:symbol];
		
		RawToken *newToken = [[RawToken alloc] init];
		newToken.Type = OperatorToken;
		newToken.LinearToken = op.SymbolText;
		return(newToken);
	}
}

+ (RawToken*)CreateNumberConstantToken:(NSString*)str
{
	RawToken *newToken = [[RawToken alloc] init];
	newToken.Type = ConstantToken;
	newToken.LinearToken = str;
	return(newToken);
}

@end
