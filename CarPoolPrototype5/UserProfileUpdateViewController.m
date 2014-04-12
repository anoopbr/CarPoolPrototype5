//
//  UserProfileUpdateViewController.m
//  CarPoolPrototype5
//
//  Created by Anoop Balakrishnan Rema on 4/8/14.
//  Copyright (c) 2014 Anoop Balakrishnan Rema. All rights reserved.
//

#import "UserProfileUpdateViewController.h"
#import <Parse/Parse.h>

@interface UserProfileUpdateViewController ()

@end

@implementation UserProfileUpdateViewController

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
    [scroll setContentSize:CGSizeMake(320, 1000)];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    
    PFUser *user = [PFUser currentUser];
    
    PFQuery *query = [PFQuery queryWithClassName:@"UserDetails"];
    
    [query whereKey:@"username" equalTo:user.objectId];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            NSLog(@"Successfully retrieved %d", objects.count);
            // Do something with the found objects
            for  (PFObject *object in objects){
                
                NSLog(@"%@",object);
                NSLog(@"%@",object[@"first"]);
                NSLog(@"%@",object[@"last"]);
                NSLog(@"%@",object[@"location"]);
                NSLog(@"%@",object[@"gender"]);
                NSLog(@"%@",object[@"first"]);
                _firstNameEditable.text = object[@"first"];
                _lastNameEditable.text = object[@"last"];
                _locationEditable.text = object[@"location"];
                _genderEditable.text = object[@"gender"];
//                _dobEditable.text = object[@"dob"];
                _aboutEditable.text = object[@"aboutme"];
                
            }
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) dismissKeyboard{
    
    [_dobEditable resignFirstResponder];
    [_firstNameEditable resignFirstResponder];
    [_lastNameEditable resignFirstResponder];
    [_aboutEditable resignFirstResponder];
    [_genderEditable resignFirstResponder];
    [_locationEditable resignFirstResponder];
}


- (IBAction)profileUpdateButtonPressed:(id)sender {
    
    PFUser *user = [PFUser currentUser];
    
    PFQuery *query = [PFQuery queryWithClassName:@"UserDetails"];
    
    [query whereKey:@"username" equalTo:user.objectId];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            NSLog(@"Successfully retrieved %d", objects.count);
            // Do something with the found objects
            
            if (objects.count == 0) {
                PFObject *userDetails = [PFObject objectWithClassName:@"UserDetails"];
                
                
                
                NSLog(@"username %@",user.objectId);
                if(![_firstNameEditable.text isEqualToString:@""]){
                    userDetails[@"first"] = _firstNameEditable.text;
                }
                if(![_lastNameEditable.text isEqualToString:@""]){
                    userDetails[@"last"] = _lastNameEditable.text;
                }
                if(![_aboutEditable.text isEqualToString:@""]){
                    userDetails[@"aboutme"] = _aboutEditable.text;
                }
                if(![_genderEditable.text isEqualToString:@""]){
                    userDetails[@"gender"] = _genderEditable.text;
                }
                if(![_locationEditable.text isEqualToString:@""]){
                    userDetails[@"location"] = _locationEditable.text;
                }
                
                userDetails[@"username"] = user.objectId;
                
                [userDetails saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                    
                    if (!error) {
                        
                        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                         UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"ProfilePage"];
                         vc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
                         [self presentViewController:vc animated:YES completion:NULL];
                        
                    }
                    else {
                        NSString *errorString = [error userInfo][@"error"];
                        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error" message:errorString delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                        [alert show];
                    }
                }];
            }else{
                for (PFObject *object in objects) {
                    
                    PFQuery *query = [PFQuery queryWithClassName:@"UserDetails"];
                    
                    // Retrieve the object by id
                    [query getObjectInBackgroundWithId:object.objectId block:^(PFObject *userUpdate, NSError *error) {
                        
                        // Now let's update it with some new data. In this case, only cheatMode and score
                        // will get sent to the cloud. playerName hasn't changed.
                        if(![_firstNameEditable.text isEqualToString:@""]){
                            userUpdate[@"first"] = _firstNameEditable.text;
                        }
                        if(![_lastNameEditable.text isEqualToString:@""]){
                            userUpdate[@"last"] = _lastNameEditable.text;
                        }
                        if(![_aboutEditable.text isEqualToString:@""]){
                            userUpdate[@"aboutme"] = _aboutEditable.text;
                        }
                        if(![_genderEditable.text isEqualToString:@""]){
                            userUpdate[@"gender"] = _genderEditable.text;
                        }
                        if(![_locationEditable.text isEqualToString:@""]){
                            userUpdate[@"location"] = _locationEditable.text;
                        }
                        [userUpdate saveInBackground];
                        
                        [self dismissViewControllerAnimated:YES completion:NULL];
                        
                        
                        
                        /*UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                        UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"ProfilePage"];
                        vc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
                        [self presentViewController:vc animated:YES completion:NULL];*/
                        
                    }];
                }
            }

        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
    

}
@end
