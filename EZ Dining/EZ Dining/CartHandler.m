//
//  CartHandler.m
//  EZ Dining
//
//  Created by Matthew O'Neil on 10/31/13.
//  Copyright (c) 2013 DJMMEK POW. All rights reserved.
//

#import "CartHandler.h"
#import "FoodItem.h"
#import "ViewController.h"

@implementation CartHandler

- (id) init:(ViewController*) creator {
    self = [super init];
    
    if (self) {
        totalPrice = 0;
        owner = creator;
        cartItems = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void) setPriceForTime:(double) price {
    timePrice = price;
}

- (double) getTotalPrice {
    [self updateTotal];
    return totalPrice;
}

- (double) getAmountRemaining {
    return timePrice - totalPrice;
}

- (void) addItemForName:(NSString *)newName andPrice:(double)newPrice {
    FoodItem *temp = [[FoodItem alloc] initWithName:newName andPrice:newPrice];
    
    [cartItems addObject:temp];
    
    totalPrice += temp.getPrice;
    [owner update:totalPrice];
}

- (double) updateTotal
{
    double sum = 0;
    for (FoodItem *food in cartItems) {
        sum += [food getPrice];
    }
    totalPrice = sum;
    return totalPrice;
}

- (NSMutableArray*) getCartItems
{
    return cartItems;
}

@end
