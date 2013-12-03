//
//  ContainerViewController.h
//  EZ Dining
//
//  Created by Eve Wassenaar on 11/26/13.
//  Copyright (c) 2013 Matthew O'Neil. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CartHandler;

@interface ContainerViewController : UIViewController
{
    CartHandler *cart;
}

- (void) setCart:(CartHandler*)newCart;
- (void) update;
@property (weak, nonatomic) IBOutlet UIButton *clearCart;
@property (weak, nonatomic) IBOutlet UILabel *totalPriceLabel;

@end
