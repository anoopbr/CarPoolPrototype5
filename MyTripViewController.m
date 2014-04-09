//
//  MyTripViewController.m
//  CarPoolPrototype5
//
//  Created by Anoop Balakrishnan Rema on 4/8/14.
//  Copyright (c) 2014 Anoop Balakrishnan Rema. All rights reserved.
//

#import "MyTripViewController.h"

@interface MyTripViewController ()

@end

@implementation MyTripViewController

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
    
    _fromLabel.text = [self.trip objectForKey:@"from"];
    _toLabel.text = [self.trip objectForKey:@"to"];
    _dateLabel.text = [NSString stringWithFormat:@"%@",[self.trip objectForKey:@"date"]];
    _descriptionLabel.text = [self.trip objectForKey:@"comment"];
    
    self.navigationItem.title =  [NSString stringWithFormat:@"%@",[self.trip objectForKey:@"comment"]];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
