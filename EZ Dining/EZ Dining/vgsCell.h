//
//  vgsCell.h
//  EZ Dining
//
//  Created by Jason Krein on 11/5/13.
//  Copyright (c) 2013 DJMMEK POW. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface vgsCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UITextView *vgName;
@property (weak, nonatomic) IBOutlet UILabel *vgPrice;
@property (weak, nonatomic) IBOutlet UIStepper *vgStepper;
@property (weak, nonatomic) IBOutlet UITextView *einsteinName;
@property (weak, nonatomic) IBOutlet UILabel *einsteinPrice;
@property (weak, nonatomic) IBOutlet UIStepper *einsteinStepper;
@property (weak, nonatomic) IBOutlet UILabel *tacosPrice;
@property (weak, nonatomic) IBOutlet UITextView *tacosName;
@property (weak, nonatomic) IBOutlet UIStepper *tacosStepper;

@end
