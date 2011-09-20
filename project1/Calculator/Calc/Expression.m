//
//  Expression.m
//  Calc
//
//  Created by MLIB116M66 on 9/19/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Expression.h"


@implementation Expression

-(id)init
{
    self=[super init];
    single=false;
    calc=false;
    first=false;
    second=false;
    oper=false;
    return self;
}
-(double)evaluate
{
    if(calc)
    {
        return result;
    }
    result=0;
    if(op==nil || !first)
    {
        return result;
        calc=true;
    }
    if([op isEqualToString:@"+"])
    {
        result=op1+op2;
    }
    else if([op isEqualToString:@"-"])
    {
        result=op1-op2;
    }
    else if([op isEqualToString:@"x"])
    {
        result=op1*op2;
    }
    else if([op isEqualToString:@"÷"])
    {
        result=op1/op2;
    }
    else if([op isEqualToString:@"1/x"])
    {
        result=1/op1;
    }
    else if([op isEqualToString:@"√"])
    {
        result=sqrt(op1);
    }
    else if([op isEqualToString:@"Sin"])
    {
        result=sin(op1);
    }
    else if([op isEqualToString:@"Cos"])
    {
        result=cos(op1);
    }
    else if([op isEqualToString:@"Tan"])
    {
        result=tan(op1);
    }
    else if([op isEqualToString:@"y^x"])
    {
        result=pow(op1, op2);
    }
    else if([op isEqualToString:@"Σ"])
    {
        result=0;
        for(int x=0; x<=op1; x++)
        {
            result+=x;
        }
    }
    else if([op isEqualToString:@"!"])
    {
        result=1;
        for(int x=1; x<=op1; x++)
        {
            result*=x;
        }
    }
    else
    {
        result=op1;
    }
    calc=true;
    return result;
}
-(BOOL)pushNum:(double) x
{
    if(first)
    {
        if(single || !oper)
        {
            return false;
        }
        op2=x;
        second=true;
    }
    else
    {
        if(oper)
        {
            return false;
        }
        op1=x;
        first=true;
    }
    return true;
}
-(BOOL)pushOper:(NSString*) x
{
    if(!first || second || oper)
    {
        return false;
    }
    op=x;
    if([op isEqualToString:@"1/x"])
    {
        single=true;
    }
    else if([op isEqualToString:@"√"])
    {
        single=true;
    }
    else if([op isEqualToString:@"Sin"])
    {
        single=true;
    }
    else if([op isEqualToString:@"Cos"])
    {
        single=true;
    }
    else if([op isEqualToString:@"Tan"])
    {
        single=true;
    }
    else if([op isEqualToString:@"Σ"])
    {
        single=true;
    }
    else if([op isEqualToString:@"!"])
    {
        single=true;
    }
    oper=true;
    return true;
}
-(BOOL)isSingle
{
    return single;
}
-(NSString*)getOper
{
    return op;
}
@end
