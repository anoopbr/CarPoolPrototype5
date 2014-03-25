//
//  MapViewController.h
//  CarPoolPrototype5
//
//  Created by Anoop Balakrishnan Rema on 3/25/14.
//  Copyright (c) 2014 Anoop Balakrishnan Rema. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MapViewController : UIViewController{
    
    MKMapView *mapview;
    
}

@property (nonatomic,retain) IBOutlet MKMapView *mapview;

-(IBAction)setMap:(id)sender;
-(IBAction)getLocation;

@end
