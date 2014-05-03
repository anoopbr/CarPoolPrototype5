//
//  TripDetailViewController.m
//  CarPoolPrototype5
//
//  Created by Anoop Balakrishnan Rema on 3/28/14.
//  Copyright (c) 2014 Anoop Balakrishnan Rema. All rights reserved.
//

#import "TripDetailViewController.h"

@interface TripDetailViewController ()

@end

@implementation TripDetailViewController

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
    
    _fromLabel.text = [self.trip objectForKey:@"From"];
    _toLabel.text = [self.trip objectForKey:@"To"];
    _dateLabel.text = [NSString stringWithFormat:@"%@",[self.trip objectForKey:@"Date"]];
    _descriptionLabel.text = [self.trip objectForKey:@"Description"];
    
    self.navigationItem.title =  [NSString stringWithFormat:@"%@",[self.trip objectForKey:@"Description"]];

    
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

- (IBAction)joinTrip:(id)sender {
    
    
    PFObject *trip = [PFObject objectWithClassName:@"TripDetails"];
    
    PFUser *user = [PFUser currentUser];
    
    trip[@"from"] = self.fromText.text;
    trip[@"to"] = self.toText.text;
    trip[@"comment"] = self.commentText.text;
    trip[@"user"] = user;
    trip[@"status"] = @"Pending";
    trip[@"tripid"] = [NSString stringWithFormat:@"%@",[self.trip objectForKey:@"objectId"]];
    
    [trip saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        
        if (!error) {

            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Success" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            
//            [self performSegueWithIdentifier:@"addTripDetailsSegue" sender:self];
            
        }
        else {
            NSString *errorString = [error userInfo][@"error"];
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error" message:errorString delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        }
    }];
        
}
@end
