//
//  BasicCell.h
//  EZ Dining
//
//  Created by Matthew O'Neil on 11/13/13.
//  Copyright (c) 2013 Matthew O'Neil. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BasicCell : UITableViewCell
{
    double price;
    NSString *name;
}

@property (weak, nonatomic) IBOutlet UITextView *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

- (IBAction)addToCart:(id)sender;
- (void) setPrice:(double)newPrice;
- (void) setName:(NSString*)newName;


@end
