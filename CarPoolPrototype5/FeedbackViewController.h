//
//  FeedbackViewController.h
//  CarPoolPrototype5
//
//  Created by Anoop Balakrishnan Rema on 5/3/14.
//  Copyright (c) 2014 Anoop Balakrishnan Rema. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RateView.h"

@interface FeedbackViewController : UIViewController <RateViewDelegate>

@property (weak, nonatomic) IBOutlet RateView *rateView;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@property (weak, nonatomic) IBOutlet UITextView *commentText;

- (IBAction)submitFeedback:(id)sender;

@end
