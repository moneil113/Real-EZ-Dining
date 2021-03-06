//
//  FoodItem.h
//  EZ Dining
//
//  Created by Matthew O'Neil on 10/31/13.
//  Copyright (c) 2013 DJMMEK POW. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FoodItem : NSObject
{
    double price;
    NSString *name;
}

- (id) initWithName:(NSString *)newName andPrice:(double)newPrice;
- (double) getPrice;
- (NSString*) getName;

@end
