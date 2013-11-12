//
//  sandCell.h
//  EZ Dining
//
//  Created by Jason Krein on 11/5/13.
//  Copyright (c) 2013 DJMMEK POW. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface sandCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UITextView *sandName;
@property (weak, nonatomic) IBOutlet UILabel *sandPrice;
@property (weak, nonatomic) IBOutlet UIStepper *sandStep;

@end
