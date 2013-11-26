//
//  FoodItem.m
//  EZ Dining
//
//  Created by Matthew O'Neil on 10/31/13.
//  Copyright (c) 2013 DJMMEK POW. All rights reserved.
//

#import "FoodItem.h"

@implementation FoodItem

- (id) initWithName:(NSString *)newName andPrice:(double)newPrice
{
    self = [super init];
    
    if (self) {
        name = newName;
        price = newPrice;
    }
    
    return self;
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
