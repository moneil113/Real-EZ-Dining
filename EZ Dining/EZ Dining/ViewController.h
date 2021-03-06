//
//  ViewController.h
//  EZ Dining
//
//  Created by Matthew O'Neil on 10/24/13.
//  Copyright (c) 2013 DJMMEK POW. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CartHandler;

@interface ViewController : UIViewController
{
    CartHandler *cart;
}

@property (weak, nonatomic) IBOutlet UILabel *totalPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *remainingPriceLabel;
- (IBAction)clearCart:(id)sender;
- (void) update:(double)newTotal;
- (CartHandler*) getCart;

@end
