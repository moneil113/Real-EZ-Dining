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
