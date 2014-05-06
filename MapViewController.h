//
//  MapViewController.h
//  CarPoolPrototype5
//
//  Created by Student on 4/29/14.
//  Copyright (c) 2014 Anoop Balakrishnan Rema. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface MapViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate>
{
    CLLocationManager *locationManager;
}

@property (strong, nonatomic) IBOutlet MKMapView *mapView;
-(IBAction)Directions:(id)sender;
@end
