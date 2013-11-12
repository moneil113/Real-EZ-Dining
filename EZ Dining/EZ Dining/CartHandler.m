//
//  CartHandler.m
//  EZ Dining
//
//  Created by Matthew O'Neil on 10/31/13.
//  Copyright (c) 2013 DJMMEK POW. All rights reserved.
//

#import "CartHandler.h"
#import "FoodItem.h"

@implementation CartHandler

- (id) init {
    self = [super init];
    
    if (self) {
        totalPrice = 0;
    }
    return self;
}

- (void) setPriceForTime:(double) price {
    timePrice = price;
}

- (double) getTotalPrice {
    return totalPrice;
}

- (double) getAmountRemaining {
    return timePrice - totalPrice;
}

- (void) addItem:(NSDictionary *)newItem {
    FoodItem *temp = [[FoodItem alloc] init:newItem];
    
    [cartItems setObject:temp forKey:[temp getName]];
    
    totalPrice += temp.getPrice;
}

- (void) deleteItem:(NSString*) name{
    [cartItems removeObjectForKey:name];
}

- (void) changeQuantity:(int)quantity forName:(NSString *)name {

    FoodItem *food = [cartItems valueForKey:name];
    
    int delta = quantity - [food getQuantity];
    
    if (quantity == 0) {
        [self deleteItem:name];
    } else {
        [food setQuantity:quantity];
    }

    totalPrice += ([food getPrice] * delta);
}

@end
