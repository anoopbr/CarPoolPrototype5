//
//  ViewProfileViewController.h
//  CarPoolPrototype5
//
//  Created by Anoop Balakrishnan Rema on 5/6/14.
//  Copyright (c) 2014 Anoop Balakrishnan Rema. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewProfileViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *profilePic;
@property (weak, nonatomic) IBOutlet UILabel *rating;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *place;
@property (weak, nonatomic) IBOutlet UILabel *about;


@property (weak, nonatomic) NSString *tripOwner;

@end
