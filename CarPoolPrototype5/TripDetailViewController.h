//
//  TripDetailViewController.h
//  CarPoolPrototype5
//
//  Created by Anoop Balakrishnan Rema on 3/28/14.
//  Copyright (c) 2014 Anoop Balakrishnan Rema. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface TripDetailViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *fromLabel;
@property (strong, nonatomic) IBOutlet UILabel *toLabel;
@property (strong, nonatomic) IBOutlet UILabel *dateLabel;
@property (strong, nonatomic) IBOutlet UILabel *descriptionLabel;
- (IBAction)joinTrip:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *fromText;
@property (weak, nonatomic) IBOutlet UITextField *toText;
@property (weak, nonatomic) IBOutlet UITextView *commentText;

@property (weak, nonatomic) PFObject *trip;

@end
