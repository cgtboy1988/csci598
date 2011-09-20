//
//  Calculator.m
//  Calc
//
//  Created by MLIB116M66 on 9/19/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Calculator.h"


@implementation Calculator

-(id)init
{
    self=[super init];
    expressions=[[NSMutableArray alloc]init];
    curExp=[[Expression alloc]init];
    return self;
}
-(void) reset
{
    [expressions release];
    expressions=nil;
    expressions=[[NSMutableArray alloc]init];
    [curExp release];
    curExp=nil;
    curExp=[[Expression alloc]init];
    [self clearMem];
}
-(NSString*)pushNum:(double) x
{
    if(![curExp pushNum:x])
    {
        double y=[curExp evaluate];
        NSString *oper=[curExp getOper];
        BOOL single=[curExp isSingle];
        //[expressions addObject:curExp];
        curExp=[[Expression alloc]init];
        if(!single)
        {
            [curExp pushNum:y];
            [curExp pushOper:oper];
        }
        [curExp pushNum:x];
    }
    return @"Got it";
}
-(NSString*)pushOp:(NSString*) x
{
    if(![curExp pushOper:x])
    {
        double y=[curExp evaluate];
        curExp=[[Expression alloc]init];
        [curExp pushNum:y];
        [curExp pushOper:x];
        return @"Made new exp";
    }
    return @"Got summin";
}
-(NSString*)getResult
{
    if(curExp==nil)
    {
        return @"0";
    }
    double x=[curExp evaluate];
    [expressions addObject:curExp];
    NSString *myReturn=[NSString stringWithFormat:@"%lf", x];
    for(int z=[myReturn length]-1; z>0; z--)
    {
        if([myReturn characterAtIndex:z]=='0')
        {
            myReturn=[myReturn substringToIndex:[myReturn length]-1];
        }
        else if([myReturn characterAtIndex:z]=='.')
        {
            myReturn=[myReturn substringToIndex:[myReturn length]-1];
            break;
        }
        else
        {
            break;
        }
    }
    return myReturn;
}
-(NSString*)goBack
{
    if([expressions count]<=1)
    {
        return @"Error: Cannot go back further";
    }
    [curExp release];
    curExp=nil;
    curExp=[expressions objectAtIndex:[expressions count]-1];
    [expressions removeObjectAtIndex:[expressions count]-1];
    return [NSString stringWithFormat:@"%f", [curExp evaluate]];
}
-(NSString*)toMem
{
    mem=curExp;
    return @"0";
}
-(NSString*)fromMem
{
    if(mem==nil)
    {
        return @"Nothing to get";
    }
    [expressions addObject:curExp];
    curExp=mem;
    return [self getResult];
}
-(NSString*)clearMem
{
    mem=nil;
    return @"0";
}


@end
