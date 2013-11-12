//
//  BasicCell.m
//  EZ Dining
//
//  Created by Matthew O'Neil on 11/12/13.
//  Copyright (c) 2013 Matthew O'Neil. All rights reserved.
//

#import "BasicCell.h"

@implementation BasicCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
