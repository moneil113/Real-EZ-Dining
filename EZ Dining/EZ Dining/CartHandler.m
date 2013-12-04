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
        NSDate * today = [NSDate date];
        NSCalendar * cal = [[NSCalendar alloc] initWithCalendarIdentifier: NSGregorianCalendar];
        
        NSDateComponents *comps = [cal components:(NSHourCalendarUnit | NSMinuteCalendarUnit) fromDate:today];
        
        if ( [comps hour] >= 7 && [comps hour] < 10 )
            timePrice = 7.90;
        
        if ( [comps hour] >= 10 && [comps hour] < 17 )
            timePrice = 9.00;
        
        if ( ([comps hour] >= 17 && [comps hour] < 20 ) || ([comps hour] == 20 && [comps minute] < 15))
            timePrice = 10.75;
        
        
        if ( ([comps hour] == 20 && [comps minute] >= 15) || ([comps hour] >= 21 || [comps hour] < 2))
            timePrice = 8.75;
        
        
        
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

- (void) updateTotal
{
    //totalPrice = newPrice;
    double sum = 0;
    for (FoodItem *food in cartItems) {
        sum += [food getPrice];
    }
    totalPrice = sum;
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
