//
//  FoodItem.m
//  EZ Dining
//
//  Created by Matthew O'Neil on 10/31/13.
//  Copyright (c) 2013 DJMMEK POW. All rights reserved.
//

#import "FoodItem.h"

@implementation FoodItem

- (id) init:(NSDictionary *)item
{
    self = [super init];
    
    if (self) {
        name = [item objectForKey:@"name"];
        price = [[item objectForKey:@"price"] doubleValue];
        quantity = 1;
    }
    
    return self;
}

- (void) setQuantity:(int) newNum {
    quantity = newNum;
}

- (int) getQuantity
{
    return quantity;
}

- (double) getPrice
{
    return price;
}

- (NSString*) getName
{
    return name;
}

@end
