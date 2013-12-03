//
//  cartTable.m
//  EZ Dining
//
//  Created by Matthew O'Neil on 11/29/13.
//  Copyright (c) 2013 Matthew O'Neil. All rights reserved.
//

#import "cartTable.h"
#import "CartHandler.h"
#import "CartCell.h"
#import "FoodItem.h"
#import "ViewController.h"

@implementation cartTable

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
    }
    return self;
}

- (void)setCart:(CartHandler *)newCart
{
    items = [newCart getCartItems];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [items count];
}

- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
    CartCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cartCell" forIndexPath:indexPath];
    
    FoodItem *tempFood = items[indexPath.row];
    
    if ([items count] == 0) {
        NSLog(@"Cart is empty");
    } else {
        cell.name.text = [tempFood getName];
        cell.priceLabel.text = [NSString stringWithFormat:@"%.2f", [tempFood getPrice]];
    }
    
    return cell;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
