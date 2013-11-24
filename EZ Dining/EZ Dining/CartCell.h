//
//  CartCell.h
//  EZ Dining
//
//  Created by Matthew O'Neil on 11/19/13.
//  Copyright (c) 2013 Matthew O'Neil. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CartCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UITextView *name;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *quantityLabel;
- (IBAction)stepperAction:(id)sender;

@end
