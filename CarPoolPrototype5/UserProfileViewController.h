//
//  UserProfileViewController.h
//  CarPoolPrototype5
//
//  Created by Anoop Balakrishnan Rema on 3/20/14.
//  Copyright (c) 2014 Anoop Balakrishnan Rema. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserProfileViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *FBProfilePictureView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UILabel *genderLabel;

// UITableView row data properties
@property (nonatomic, strong) NSArray *rowTitleArray;
@property (nonatomic, strong) NSMutableArray *rowDataArray;
@property (nonatomic, strong) NSMutableData *imageData;

@end
