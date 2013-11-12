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
    int quantity;
}

- (id) init:(NSDictionary *)item;
- (int) getQuantity;
- (void) setQuantity:(int) newNum;
- (double) getPrice;
- (NSString*) getName;

@end
