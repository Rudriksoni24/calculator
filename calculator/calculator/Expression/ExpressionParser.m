//
//  ExpressionParser.m
//  calculator
//
//  Created by Rudrik on 04/01/19.
//

#include "ExpressionParser.h"

@implementation ExpressionParser

+ (NSMutableArray*)Parse:(NSString*)expression
{
	NSMutableArray *tokens = [[NSMutableArray alloc] init];
	NSString *currentNumberString = @"";
	for (int i = 0; i < [expression length]; i++)
	{
		char currentChar = [expression characterAtIndex:i];
		
		if([ExpressionUtility IsDigit:currentChar] == TRUE)
		{
			currentNumberString = [currentNumberString stringByAppendingFormat:@"%c", currentChar];
		}
		else
		{
			if([currentNumberString length] > 0)
			{
				RawToken *numberToken = [ExpressionUtility CreateNumberConstantToken:currentNumberString];
				[tokens addObject:numberToken];
				
				currentNumberString = @"";
			}

			RawToken *operatorToken = [ExpressionUtility CreateOperatorToken:currentChar];
			if(operatorToken != nil)
			{
				[tokens addObject:operatorToken];
			}
		}
	}

	if([currentNumberString length] > 0)
	{
		RawToken *numberToken = [ExpressionUtility CreateNumberConstantToken:currentNumberString];
		[tokens addObject:numberToken];
	}
	return(tokens);
}

@end
