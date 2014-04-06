//
//  ScheduleTripViewController.m
//  CarPoolPrototype5
//
//  Created by Anoop Balakrishnan Rema on 4/5/14.
//  Copyright (c) 2014 Anoop Balakrishnan Rema. All rights reserved.
//

#import "ScheduleTripViewController.h"
#import <Parse/Parse.h>

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
    
    seatLabel.text = @"0";
    
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
        [self addTrip];
    }
}

- (void)addTrip{
    
    NSDate *date = [tripDate date];
    
    PFObject *tripDetails = [PFObject objectWithClassName:@"Trips"];
    
    PFUser *user = [PFUser currentUser];
    
    tripDetails[@"From"] = fromPlace.text;
    tripDetails[@"To"] = toPlace.text;
    tripDetails[@"Date"] = date;
    tripDetails[@"User"] = user;
    tripDetails[@"Seats"] = seatLabel.text;
    tripDetails[@"Description"] = description.text;
    [tripDetails saveEventually];
    
    
    fromPlace.text = @"";
    toPlace.text = @"";
    description.text = @"";
    seatLabel.text = @"0";
    
    [self performSegueWithIdentifier:@"addTripDetailsSegue" sender:self];
    
}

- (void) dismissKeyboard{
    
    [fromPlace resignFirstResponder];
    [toPlace resignFirstResponder];
    [description resignFirstResponder];
}
@end
