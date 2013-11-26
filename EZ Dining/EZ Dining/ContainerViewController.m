//
//  ContainerViewController.m
//  EZ Dining
//
//  Created by Eve Wassenaar on 11/26/13.
//  Copyright (c) 2013 Matthew O'Neil. All rights reserved.
//

#import "ContainerViewController.h"
#import "CartTableViewController.h"

@interface ContainerViewController ()

@end

@implementation ContainerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) setCart:(CartHandler *)newCart
{
    cart = newCart;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"CartContainer"]) {
        CartTableViewController *myVC = [segue destinationViewController];
        [myVC setCart:cart];
    }
}
@end
