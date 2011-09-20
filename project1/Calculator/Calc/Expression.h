//
//  Expression.h
//  Calc
//
//  Created by MLIB116M66 on 9/19/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Expression : NSObject
{
    double op1;
    double op2;
    double result;
    NSString *op;
    BOOL single;
    BOOL calc;
    BOOL first;
    BOOL second;
    BOOL oper;
}

-(double)evaluate;
-(BOOL)pushNum:(double) x;
-(BOOL)pushOper:(NSString*) x;
-(BOOL)isSingle;
-(NSString*)getOper;

@end
