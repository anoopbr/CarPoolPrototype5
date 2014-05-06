//
//  ViewProfileViewController.m
//  CarPoolPrototype5
//
//  Created by Anoop Balakrishnan Rema on 5/6/14.
//  Copyright (c) 2014 Anoop Balakrishnan Rema. All rights reserved.
//

#import "ViewProfileViewController.h"
#import <Parse/Parse.h>

@interface ViewProfileViewController ()

@end

@implementation ViewProfileViewController

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
    
    NSLog(@"tripid");
    NSLog(self.tripOwner);
    
    PFUser *user = [PFUser currentUser];
    
    PFQuery *query = [PFUser query];
    
    [query getObjectWithId:user];
    
    NSLog(@"%@",user);
    
    NSString *first = user[@"first"];
    NSString *last = user[@"last"];
    NSString *aboutme = user[@"aboutme"];
    NSString *phone = user[@"phone"];
    NSString *gender = user[@"gender"];
    NSString *place = user[@"place"];
    NSMutableString *name = [NSString stringWithFormat: @"%@ %@", first, last];
    NSDate *dob = user[@"createdAt"];
    PFFile *userImageFile = user[@"image"];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM/dd/yyyy"];
    
    NSString *date = [dateFormatter stringFromDate:dob];
    
    self.name.text = name;
    self.about.text = aboutme;
    self.place.text = place;
    [userImageFile getDataInBackgroundWithBlock:^(NSData *imageData, NSError *error) {
        if (!error) {
            _profilePic.image = [UIImage imageWithData:imageData];
        }
    }];
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

@end
