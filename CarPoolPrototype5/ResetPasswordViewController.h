//
//  ResetPasswordViewController.h
//  CarPoolPrototype5
//
//  Created by Anoop Balakrishnan Rema on 4/14/14.
//  Copyright (c) 2014 Anoop Balakrishnan Rema. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResetPasswordViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *emailField;

- (IBAction)resetButtonPressed:(id)sender;

@end
