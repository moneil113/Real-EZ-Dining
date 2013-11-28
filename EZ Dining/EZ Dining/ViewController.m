//
//  ViewController.m
//  EZ Dining
//
//  Created by Matthew O'Neil on 10/24/13.
//  Copyright (c) 2013 DJMMEK POW. All rights reserved.
//

#import "ViewController.h"
#import "CartHandler.h"
#import "ContainerViewController.h"

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
    [self update:[cart updateTotal]];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"GoToCart"]) {
        ContainerViewController *myVC = [segue destinationViewController];
        [myVC setCart:cart];
    }
}

- (void) viewWillAppear:(BOOL)animated
{
    [self update:[cart updateTotal]];
}

@end
