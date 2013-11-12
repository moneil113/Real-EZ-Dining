//
//  CartHandler.h
//  EZ Dining
//
//  Created by Matthew O'Neil on 10/31/13.
//  Copyright (c) 2013 DJMMEK POW. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CartHandler : NSObject

{
    NSMutableDictionary *cartItems;
    double totalPrice;
    NSDictionary *foodItem;
    double timePrice;
}

- (void) setPriceForTime:(double) price;
- (double) getTotalPrice;
- (void) addItem:(NSDictionary *)newItem;
- (void) deleteItem:(NSString *) name;
- (void) changeQuantity:(int) quantity forName:(NSString *) name;
- (double) getAmountRemaining;

@end
