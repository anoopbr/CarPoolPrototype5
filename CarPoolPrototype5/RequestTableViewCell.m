//
//  RequestTableViewCell.m
//  CarPoolPrototype5
//
//  Created by Anoop Balakrishnan Rema on 5/5/14.
//  Copyright (c) 2014 Anoop Balakrishnan Rema. All rights reserved.
//

#import "RequestTableViewCell.h"

@implementation RequestTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
