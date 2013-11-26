//
//  ViewController.m
//  EZ Dining
//
//  Created by Matthew O'Neil on 10/24/13.
//  Copyright (c) 2013 DJMMEK POW. All rights reserved.
//

#import "ViewController.h"
#import "CartHandler.h"
#import "CartTableViewController.h"

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
    cart = [[CartHandler alloc] init:self];
    [cart updateTotal];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"GoToCart"]) {
        CartTableViewController *myVC = [segue destinationViewController];
        [myVC performSelector:@selector(setCart:)withObject:cart];
    }
}

- (void) viewWillAppear:(BOOL)animated
{
    [cart updateTotal];
}

@end
