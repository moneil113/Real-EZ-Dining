//
//  CartViewController.h
//  EZ Dining
//
//  Created by Matthew O'Neil on 11/19/13.
//  Copyright (c) 2013 Matthew O'Neil. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CartHandler;

@interface CartViewController : UIViewController
{
    CartHandler *cart;
}
- (void) setCart:(CartHandler*)newCart;

@end
