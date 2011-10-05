//
//  WhereamiAppDelegate.h
//  Whereami
//
//  Created by student on 9/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface WhereamiAppDelegate : NSObject <UIApplicationDelegate, CLLocationManagerDelegate, MKMapViewDelegate> {

CLLocationManager *locationManager;
IBOutlet MKMapView *worldView;
IBOutlet UIActivityIndicatorView *activityIndicator;
IBOutlet UITextField *locationTitleField;

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end
