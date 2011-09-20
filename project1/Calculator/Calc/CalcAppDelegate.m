//
//  CalcAppDelegate.m
//  Calc
//
//  Created by STUDENT on 9/19/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CalcAppDelegate.h"

@implementation CalcAppDelegate


@synthesize window=_window;

- (id)init
{
    self=[super init];
    myCalc=[[Calculator alloc]init];
    isOp=false;
    error=false;
    return self;
}

- (IBAction)numberPushed:(id)sender
{
    UIButton *pushedButton=(UIButton *)sender;
    NSString *curText=[display text];
    NSString *numToAppend=[pushedButton currentTitle];
    if(error)
    {
        return;
    }
    if(isOp)
    {
        curText=[myCalc pushOp:curText];
        curText=@"";
        isOp=false;
    }
    if([numToAppend isEqualToString:@"-"])
    {
        char tmp=[curText characterAtIndex:0];
        if(tmp=='-')
        {
            curText=[curText substringFromIndex:1];
        }
        else
        {
            curText=[numToAppend stringByAppendingString:(curText)];
        }
    }
    else if([numToAppend isEqualToString:@"π"])
    {
        curText=@"3.14159265";
    }
    else if([numToAppend isEqualToString:@"e"])
    {
        curText=@"2.71828183";
    }
    else if([numToAppend isEqualToString:@"."])
    {
        NSRange range=[curText rangeOfString:@"." options:NSCaseInsensitiveSearch];
        if(range.location!=NSNotFound)
        {
            curText=@"Error: Already has a decimal.";
            error=true;
        }
        else
        {
            curText=[curText stringByAppendingString:(numToAppend)];
        }
    }
    else if([curText doubleValue]==0)
    {
        NSRange range=[curText rangeOfString:@"." options:NSCaseInsensitiveSearch];
        if(range.location!=NSNotFound)
        {
            curText=[curText stringByAppendingString:(numToAppend)];
        }
        else
        {
            curText=numToAppend;
        }
    }
    else
    {
        curText=[curText stringByAppendingString:(numToAppend)];
    }
    [display setText:curText];
}
-(IBAction)operatorPushed:(id)sender
{
    if(error)
    {
        return;
    }
    UIButton *pushedButton=(UIButton *)sender;
    NSString *curOp=[pushedButton currentTitle];
    NSString *curText=[display text];
    double curNum=[curText doubleValue];
    [myCalc pushNum:curNum];
    isOp=true;
    [display setText:curOp];
}
-(IBAction)commandPushed:(id)sender
{
    UIButton *pushedButton=(UIButton *)sender;
    NSString *curCom=[pushedButton currentTitle];
    NSString *curText=[display text];
    if([curCom isEqualToString:@"C"])
    {
        curCom=@"0";
        if(isOp)
        {
            curCom=curText;
        }
    }
    else if([curCom isEqualToString:@"AC"])
    {
        error=false;
        [myCalc reset];
        isOp=false;
        curCom=@"0";
    }
    else if([curCom isEqualToString:@"="])
    {
        if(isOp)
        {
            [myCalc pushOp:curText];
        }
        else
        {
            [myCalc pushNum:[curText doubleValue]];
        }
        isOp=false;
        curCom=[myCalc getResult];
    }
    else if([curCom isEqualToString:@"Back"])
    {
        curCom=[myCalc goBack];
    }
    else if([curCom isEqualToString:@"M"])
    {
        if(isOp)
        {
            [myCalc pushOp:curText];
        }
        else
        {
            [myCalc pushNum:[curText doubleValue]];
        }
        curCom=[myCalc toMem];
    }
    else if([curCom isEqualToString:@"MR"])
    {
        curCom=[myCalc fromMem];
    }
    else if([curCom isEqualToString:@"MC"])
    {
        [myCalc clearMem];
        curCom=curText;
    }
    [display setText:curCom];
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

@end
