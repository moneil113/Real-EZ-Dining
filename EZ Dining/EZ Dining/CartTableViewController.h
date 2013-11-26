//
//  CartTableViewController.h
//  EZ Dining
//
//  Created by Matthew O'Neil on 11/22/13.
//  Copyright (c) 2013 Matthew O'Neil. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CartHandler;

@interface CartTableViewController : UITableViewController
{
    NSArray *items;
}

- (void) setCart:(CartHandler*)newCart;

@end
