//
//  BasicCell.m
//  EZ Dining
//
//  Created by Matthew O'Neil on 11/13/13.
//  Copyright (c) 2013 Matthew O'Neil. All rights reserved.
//

#import "BasicCell.h"
#import "ViewController.h"
#import "CartHandler.h"

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

- (void) setPrice:(double)newPrice
{
    price = newPrice;
}

- (void) setName:(NSString *)newName
{
    name = newName;
}

- (IBAction)addToCart:(id)sender {
    ViewController *view;
    
    for (UIView* next = [self superview]; next; next = next.superview)
    {
        UIResponder* nextResponder = [next nextResponder];
        
        if ([nextResponder isKindOfClass:[ViewController class]])
        {
            view = (ViewController*)nextResponder;
        }
    }
    
    [[view getCart] addItemForName:name andPrice:price];
    
    //Reloading data
    NSArray* children = view.childViewControllers;
    UITableViewController* myChild = children[0];
    myChild.tableView.reloadData;
    
}

@end
