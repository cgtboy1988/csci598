//
//  Calculator.h
//  Calc
//
//  Created by MLIB116M66 on 9/19/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Expression.h"

@interface Calculator : NSObject
{
    NSMutableArray *expressions;
    Expression *curExp;
    Expression *mem;
}
-(void) reset;
-(NSString*)pushNum:(double) x;
-(NSString*)pushOp:(NSString*) x;
-(NSString*)getResult;
-(NSString*)goBack;
-(NSString*)toMem;
-(NSString*)fromMem;
-(NSString*)clearMem;

@end
