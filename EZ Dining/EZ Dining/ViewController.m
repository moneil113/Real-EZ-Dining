//
//  ViewController.m
//  EZ Dining
//
//  Created by Matthew O'Neil on 10/24/13.
//  Copyright (c) 2013 DJMMEK POW. All rights reserved.
//

#import "ViewController.h"
#import "CartHandler.h"

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    cart = [[CartHandler alloc] init:self];
    
    NSDate * today = [NSDate date];
    NSCalendar * cal = [[NSCalendar alloc] initWithCalendarIdentifier: NSGregorianCalendar];
    
    NSDateComponents * comps = [cal components:NSHourCalendarUnit fromDate:today];
    
    if ( [comps hour]>0 && [comps hour] < 12 )
        [cart setPriceForTime:9.00];
    
    if ( [comps hour] > 12 && [comps hour] < 17 )
        [cart setPriceForTime:10.75];
    
    if ( [comps hour] >17 && [comps hour]<24  )
        [cart setPriceForTime:8.75];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) update:(double)newTotal {
    self.totalPriceLabel.text = [NSString stringWithFormat:@"$%.2f", newTotal];
}

- (CartHandler*) getCart
{
    return cart;
}

- (IBAction)clearCart:(id)sender {
    [cart updateTotal:0];
}

@end
