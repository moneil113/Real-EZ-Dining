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

@interface ViewController()
    @property NSArray *foods;
    @property NSMutableArray* allStrings;
    @property NSMutableArray* filtered;
    @property BOOL isFiltered;
@end



@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    cart = [[CartHandler alloc] init:self];
    self.remainingPriceLabel.text = [NSString stringWithFormat:@"$%.2f", [cart getAmountRemaining]];
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self update:[cart getTotalPrice]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) update:(double)newTotal {
    self.totalPriceLabel.text = [NSString stringWithFormat:@"$%.2f", newTotal];
    self.remainingPriceLabel.text = [NSString stringWithFormat:@"$%.2f", [cart getAmountRemaining]];
}


- (CartHandler*) getCart
{
    return cart;
}

- (IBAction)clearCart:(id)sender {
    [[cart getCartItems] removeAllObjects];
    [cart updateTotal];
    [self update:[cart getTotalPrice]];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"GoToCart"]) {
        ContainerViewController *myVC = [segue destinationViewController];
        [myVC setCart:cart];
    }
}




@end
