//
//  BasicCell.m
//  EZ Dining
//
//  Created by Matthew O'Neil on 11/13/13.
//  Copyright (c) 2013 Matthew O'Neil. All rights reserved.
//

#import "BasicCell.h"
#import "ViewController.h"

@implementation BasicCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)stepperAction:(UIStepper *)sender {
    ViewController *view;
    
    for (UIView* next = [self superview]; next; next = next.superview)
    {
        UIResponder* nextResponder = [next nextResponder];
        
        if ([nextResponder isKindOfClass:[ViewController class]])
        {
            view = (ViewController*)nextResponder;
        }
    }
    
    view.totalPriceLabel.text = [NSString stringWithFormat:@"$%.2f", sender.value];
    
    
    //ViewController *view = (ViewController*)self.superview.superview;
    //view.totalPriceLabel.text = [NSString stringWithFormat:@"$%f", sender.value];
}

@end
