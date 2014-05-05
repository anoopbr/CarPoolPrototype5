//
//  MainMenuViewController.m
//  CarPoolPrototype5
//
//  Created by Anoop Balakrishnan Rema on 3/23/14.
//  Copyright (c) 2014 Anoop Balakrishnan Rema. All rights reserved.
//

#import "MainMenuViewController.h"

@interface MainMenuViewController ()

@end

@implementation MainMenuViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (NSString *) segueIdentifierForIndexPathInLeftMenu:(NSIndexPath *)indexPath{
    
    NSString *identifier;
    switch (indexPath.row) {
        case 0:
            identifier = @"DashBoardSegue";
            break;
        case 1:
            identifier = @"DashBoardSegue";
            break;
        case 2:
            identifier = @"TripsSegue";
            break;
        case 3:
            identifier = @"ScheduleSegue";
            break;
        case 4:
            identifier = @"BrowseSegue";
            break;
    }
    
    return identifier;
}

-(void)configureLeftMenuButton:(UIButton *)button{
    CGRect frame = button.frame;
    frame.origin = (CGPoint){0,0};
    frame.size = (CGSize){40,40};
    button.frame = frame;
    
    [button setImage:[UIImage imageNamed:@"menuButton"] forState:UIControlStateNormal];
}

@end
