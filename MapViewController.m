//
//  MapViewController.m
//  CarPoolPrototype5
//
//  Created by Student on 4/29/14.
//  Copyright (c) 2014 Anoop Balakrishnan Rema. All rights reserved.
//

#import "MapViewController.h"
#import <Parse/Parse.h>

@interface MapViewController ()

@end

@implementation MapViewController
{
    MKPointAnnotation *point;
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}



-(void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //Make this controller the delegate for the map view.
    self.mapView.delegate = self;
    
    // Ensure that you can view your own location in the map view.
    [self.mapView setShowsUserLocation:YES];
    
    //Instantiate a location object.
    locationManager = [[CLLocationManager alloc] init];
    
    //Make this controller the delegate for the location manager.
    [locationManager setDelegate:self];
    
    //Set some parameters for the location object.
    [locationManager setDistanceFilter:kCLDistanceFilterNone];
    [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    
    
    /*    PFUser * userForQuery; // set up your user for the query, if it's current user, = [PFUser currentUser];
     
     // first part of predicate
     PFQuery *innerQueryA = [PFQuery queryWithClassName:@"TripDetails"];
     
     [innerQueryA whereKey:@"UserFriend" equalTo:userForQuery]; // from  @"UserFriendId"
     [innerQueryA whereKey:@"User" notEqualTo:userForQuery]; // from @"UserId"
     */
    
    
    /*
     NSObject *to = @"New York";
     NSObject *from = @"Connecticut";
     
     from.latitude = (double)locationManager.location.coordinate.latitude;
     from.longitude = (double)locationManager.location.coordinate.longitude;
     
     if (!(from.longitude == 0 &amp;&amp; from.latitude == 0) &amp;&amp; !(((fabs(to.latitude) - fabs(from.latitude)) &gt; 5) || ((fabs(to.longitude) - fabs(from.longitude)) &gt; 5))) {
     [mapView showRouteFrom:from to:to];
     } else {
     from.longitude = to.longitude-0.01;
     from.latitude = to.latitude-0.01;
     [mapView showRouteFrom:from to:to];
     }
     */
}




- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 800, 800);
    [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
    
    // Add an annotation
    
    point = [[MKPointAnnotation alloc] init];
    point.coordinate = userLocation.coordinate;
    point.title = @"Where am I?";
    point.subtitle = @"I'm here!!!";
    
    [self.mapView addAnnotation:point];
    
    CLLocationCoordinate2D userCoordinate = userLocation.location.coordinate;
    
    for(int i = 1; i<=5;i++)
    {
        CGFloat latDelta = rand()*.035/RAND_MAX -.02;
        CGFloat longDelta = rand()*.03/RAND_MAX -.015;
        
        CLLocationCoordinate2D newCoord = { userCoordinate.latitude + latDelta, userCoordinate.longitude + longDelta };
        MKPointAnnotation *mp = [[MKPointAnnotation alloc] init];
        mp.coordinate = newCoord;
        mp.title = [NSString stringWithFormat:@"Azam Home %d",i];
        mp.subtitle = @"Home Sweet Home";
        [self.mapView addAnnotation:mp];
        // [mp release];
        
    }
}
/*
 - (CLLocationCoordinate2D) geoCodeUsingAddress:(NSString *)address
 {
 NSString *esc_addr =  [address stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
 NSString *req = [NSString stringWithFormat:@"http://maps.google.com/maps/api/geocode/json?sensor=true&amp;address=%@", esc_addr];
 CLLocationCoordinate2D center;
 
 NSString *result = [NSString stringWithContentsOfURL:[NSURL URLWithString:req] encoding:NSUTF8StringEncoding error:NULL];
 if (result)
 {
 NSLog(@"LOC RESULT: %@", result);
 NSError *e;
 NSDictionary *resultDict = [NSJSONSerialization JSONObjectWithData: [result dataUsingEncoding:NSUTF8StringEncoding] options: NSJSONReadingMutableContainers error: &amp;e;
 NSArray *resultsArray = [resultDict objectForKey:@"results"];
 
 if(resultsArray.count &gt; 0;)
 {
 resultDict = [[resultsArray objectAtIndex:0] objectForKey:@"geometry"];
 resultDict = [resultDict objectForKey:@"location"];
 center.latitude = [[resultDict objectForKey:@"lat"] floatValue];
 center.longitude = [[resultDict objectForKey:@"lng"] floatValue];
 NSLog(@"Long: %f Lat: %f", center.longitude, center.latitude);
 }
 else
 {
 UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Inget att visa" message:@"Det gick inte att visa den plats du valt. Försök igen." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
 [alert show];
 }
 }
 return center;
 }
 */

-(IBAction)Directions:(id)sender{
    CLLocationCoordinate2D coords =  point.coordinate;
    NSString *urlString = [NSString stringWithFormat:@"http://maps.google.com/maps?saddr=%g,%g&daddr=50.967222,-2.153611", coords.latitude, coords.longitude];
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
}

- (void)mapView:(MKMapView *)mv didAddAnnotationViews:(NSArray *)views {
    //  MKCoordinateRegion region;
    //   region = MKCoordinateRegionMakeWithDistance(locationManager.location.coordinate,1000,1000);
    
    
    //   [mv setRegion:region animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
