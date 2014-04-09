//
//  ScheduleTripViewController.m
//  CarPoolPrototype5
//
//  Created by Anoop Balakrishnan Rema on 4/5/14.
//  Copyright (c) 2014 Anoop Balakrishnan Rema. All rights reserved.
//

#import "ScheduleTripViewController.h"
#import <Parse/Parse.h>
#import "ScheduledTripDetailsViewController.h"

PFObject *parseObject;
NSString *setFrom, *setTo, *setDescription, *setSeats ;
NSDate *setDate;

@interface ScheduleTripViewController ()

@end

@implementation ScheduleTripViewController

@synthesize tripDate, fromPlace, toPlace, description, seatLabel, seatSlider;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [scroll setScrollEnabled:YES];
    [scroll setContentSize:CGSizeMake(320, 800)];
    
    int slideValue = seatSlider.value;
    seatLabel.text = [[NSString alloc]initWithFormat:@"%d",slideValue];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)submitTrip:(id)sender {
    
    [fromPlace resignFirstResponder];
    [toPlace resignFirstResponder];
    [description resignFirstResponder];
    
    [self validateFrom];
    
}

- (IBAction)seatSliderMoved:(id)sender {
    
    int slideValue = seatSlider.value;
    seatLabel.text = [[NSString alloc]initWithFormat:@"%d",slideValue];
}

- (void)validateFrom{
    if ([fromPlace.text isEqualToString:@""]||[toPlace.text isEqualToString:@""]||[description.text isEqualToString:@""]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Fill all the fields" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    } else {
        NSLog(@"validateFrom else");
        [self addTrip];
    }
}

- (void)addTrip{
    
    NSDate *date = [tripDate date];
    
    PFObject *trip = [PFObject objectWithClassName:@"Trips"];

    PFUser *user = [PFUser currentUser];
    
    trip[@"From"] = fromPlace.text;
    trip[@"To"] = toPlace.text;
    trip[@"Date"] = date;
    trip[@"User"] = user;
    trip[@"Seats"] = seatLabel.text;
    trip[@"Description"] = description.text;

    [trip saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        
        if (!error) {
            
            setFrom = fromPlace.text;
            setTo = toPlace.text;
            setDate = date;
            setSeats = seatLabel.text;
            setDescription = description.text;
            
            parseObject = [trip objectId];
            NSLog(@"Object id %@",parseObject);
            
            
            PFObject *tripDetails = [PFObject objectWithClassName:@"TripDetails"];
            tripDetails[@"from"] = fromPlace.text;
            tripDetails[@"to"] = toPlace.text;
            tripDetails[@"date"] = date;
            tripDetails[@"user"] = user;
            tripDetails[@"comment"] = description.text;
            tripDetails[@"tripid"] = parseObject;
            tripDetails[@"status"] = @"Owner";
            
            [tripDetails saveInBackground];
            
            fromPlace.text = @"";
            toPlace.text = @"";
            description.text = @"";
            seatLabel.text = @"0";
            
            [self performSegueWithIdentifier:@"addTripDetailsSegue" sender:self];
            
        }
        else {
            NSString *errorString = [error userInfo][@"error"];
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error" message:errorString delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        }
    }];
    
}

- (void) dismissKeyboard{
    
    [fromPlace resignFirstResponder];
    [toPlace resignFirstResponder];
    [description resignFirstResponder];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    NSLog(@"segue identifier, %@",[segue identifier]);
    
    if ([[segue identifier] isEqualToString:@"addTripDetailsSegue"]) {
        
        NSLog(@"Segue Pressed : %@",parseObject);
        
        ScheduledTripDetailsViewController *detailViewController = [segue destinationViewController];
        
        detailViewController.detailsFromPlaceText = setFrom;
        detailViewController.detailsToPlaceText = setTo;
        detailViewController.detailsTripDateText = setDate;
        detailViewController.detailsTripSeatsAvailableText = setSeats;
        detailViewController.detailsTripDescriptionText = setDescription;
        
        
    }
}

@end
