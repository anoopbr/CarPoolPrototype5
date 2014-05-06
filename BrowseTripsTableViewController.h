//
//  BrowseTripsTableViewController.h
//  CarPoolPrototype5
//
//  Created by Anoop Balakrishnan Rema on 3/26/14.
//  Copyright (c) 2014 Anoop Balakrishnan Rema. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "BrowseTripsTableViewCell.h"

@interface BrowseTripsTableViewController : PFQueryTableViewController


@property (nonatomic, strong) NSArray *fromObjectArray;
@property (nonatomic, strong) NSArray *toObjectArray;
@property (nonatomic, strong) NSArray *dateObjectArray;
@property (nonatomic, strong) NSArray *descriptionObjectArray;

@property (nonatomic, strong) NSArray *seacrhfromObjectArray;
@property (nonatomic, strong) NSArray *seacrhtoObjectArray;
@property (nonatomic, strong) NSArray *seacrhdateObjectArray;
@property (nonatomic, strong) NSArray *seacrhdescriptionObjectArray;

@property (nonatomic, strong) NSArray *ObjectArray;

@end
