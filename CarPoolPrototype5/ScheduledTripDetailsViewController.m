//
//  ScheduledTripDetailsViewController.m
//  CarPoolPrototype5
//
//  Created by Anoop Balakrishnan Rema on 4/6/14.
//  Copyright (c) 2014 Anoop Balakrishnan Rema. All rights reserved.
//

#import "ScheduledTripDetailsViewController.h"

@interface ScheduledTripDetailsViewController ()

@end

@implementation ScheduledTripDetailsViewController

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
    
    _detailsFromPlace.text = self.detailsFromPlaceText;
    _detailsToPlace.text = self.detailsToPlaceText;
    _detailsTripDate.text = [NSString stringWithFormat:@"%@",self.detailsTripDateText];
    _detailsTripDescription.text = self.detailsTripDescriptionText;
    _detailsTripSeatsAvailable.text = self.detailsTripSeatsAvailableText;
    
    self.navigationItem.title =  [NSString stringWithFormat:@"%@",self.detailsTripDescriptionText];
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