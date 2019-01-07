 //
 //  Enumerations.h
 //  calculator
 //
 //  Created by Rudrik on 04/01/19.
 //

typedef enum
{
	EmptyPrimitiveDataType=0,
	Number=1,
	Text=2
} PrimitiveDataType;

typedef enum
{
	EmptyTokenType=0,
	OperatorToken=1,
	ConstantToken=2
} TokenType;

typedef enum
{
	EmptyOperatorSymbol=0,
	Plus=1,
	Minus=2,
	Multiply=3,
	Divide=4,
	Modulus=5,
	Power=6,
	OpenParenthesis=7,
	CloseParenthesis=8
} OperatorSymbol;

typedef enum
{
	EmptyOperatorAssociativity=0,
	LeftToRight=1,
	RightToLeft=2
} OperatorAssociativity;
