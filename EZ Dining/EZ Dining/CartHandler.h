//
//  CartHandler.h
//  EZ Dining
//
//  Created by Matthew O'Neil on 10/31/13.
//  Copyright (c) 2013 DJMMEK POW. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ViewController;

@interface CartHandler : NSObject

{
    NSMutableArray *cartItems;
    double totalPrice;
    //NSDictionary *foodItem;
    double timePrice;
    ViewController *owner;
}

- (id) init:(ViewController*) creator;
- (void) setPriceForTime:(double)price;
- (double) getTotalPrice;
- (void) addItemForName:(NSString *)newName andPrice:(double)newPrice;
- (double) getAmountRemaining;
- (void) updateTotal;
- (void) addCost:(double) costToAdd;
- (NSMutableArray*) getCartItems;

@end
