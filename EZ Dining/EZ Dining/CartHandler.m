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

- (void) deleteItem:(NSString*) name{
    //[cartItems rem:name];
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

- (void) updateTotal:(double)newPrice
{
    totalPrice = newPrice;
    [owner update:totalPrice];
}

- (void) addCost:(double)costToAdd {
    totalPrice += costToAdd;
    [owner update:totalPrice];
}

- (NSMutableArray*) getCartItems
{
    return cartItems;
}

@end
