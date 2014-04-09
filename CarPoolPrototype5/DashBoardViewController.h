//
//  DashBoardViewController.h
//  CarPoolPrototype5
//
//  Created by Anoop Balakrishnan Rema on 3/19/14.
//  Copyright (c) 2014 Anoop Balakrishnan Rema. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "MapPoint.h"

@interface DashBoardViewController : UIViewController <CLLocationManagerDelegate>
{
    
    CLLocationManager *locationManager;
    CLLocationCoordinate2D currentCentre;
    int currenDist;
    BOOL firstLaunch;
}


- (IBAction)logoutButton:(id)sender;
- (IBAction)logoutBtn:(id)sender;

@end
