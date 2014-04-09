//
//  MyTripsTableViewController.h
//  CarPoolPrototype5
//
//  Created by Anoop Balakrishnan Rema on 4/8/14.
//  Copyright (c) 2014 Anoop Balakrishnan Rema. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface MyTripsTableViewController : PFQueryTableViewController


@property (nonatomic, strong) NSArray *fromObjectArray;
@property (nonatomic, strong) NSArray *toObjectArray;
@property (nonatomic, strong) NSArray *dateObjectArray;
@property (nonatomic, strong) NSArray *descriptionObjectArray;

@end
