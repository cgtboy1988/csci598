//
//  CalcAppDelegate.h
//  Calc
//
//  Created by STUDENT on 9/19/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Calculator.h"

@interface CalcAppDelegate : NSObject <UIApplicationDelegate>
{
    IBOutlet UILabel *display;
    BOOL isOp;
    BOOL error;
    Calculator *myCalc;
}
- (IBAction)numberPushed:(id)sender;
- (IBAction)operatorPushed:(id)sender;
- (IBAction)commandPushed:(id)sender;

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end
