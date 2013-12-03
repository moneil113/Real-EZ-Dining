//
//  cartTable.h
//  EZ Dining
//
//  Created by Matthew O'Neil on 11/29/13.
//  Copyright (c) 2013 Matthew O'Neil. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CartHandler;

@interface cartTable : UITableView <UITableViewDelegate, UITableViewDataSource>
{
    NSMutableArray *items;
}

- (void) setCart:(CartHandler*)newCart;

@end
