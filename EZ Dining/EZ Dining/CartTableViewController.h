//
//  CartTableViewController.h
//  EZ Dining
//
//  Created by Matthew O'Neil on 11/22/13.
//  Copyright (c) 2013 Matthew O'Neil. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CartHandler;
@class ContainerViewController;

@interface CartTableViewController : UITableViewController
{
    CartHandler *cart;
    NSMutableArray *items;
    ContainerViewController *owner;
}

- (void) setCart:(CartHandler*)newCart;
- (void) setOwner:(ContainerViewController*)creator;

@end
