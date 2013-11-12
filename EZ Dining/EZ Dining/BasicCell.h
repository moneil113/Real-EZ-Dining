//
//  BasicCell.h
//  EZ Dining
//
//  Created by Matthew O'Neil on 11/12/13.
//  Copyright (c) 2013 Matthew O'Neil. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BasicCell : UITableViewCell
{
    UITextView *name;
    UITextView *price;
    UIStepper *stepper;
}

@end
