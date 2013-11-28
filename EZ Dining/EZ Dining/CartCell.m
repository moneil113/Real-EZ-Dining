//
//  CartCell.m
//  EZ Dining
//
//  Created by Matthew O'Neil on 11/19/13.
//  Copyright (c) 2013 Matthew O'Neil. All rights reserved.
//

#import "CartCell.h"

@implementation CartCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)stepperAction:(id)sender {
}
@end
