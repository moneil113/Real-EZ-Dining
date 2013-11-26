//
//  CartViewController.m
//  EZ Dining
//
//  Created by Matthew O'Neil on 11/19/13.
//  Copyright (c) 2013 Matthew O'Neil. All rights reserved.
//

#import "CartViewController.h"
#import "CartHandler.h"
#import "CartCell.h"

@interface CartViewController ()

@end

@implementation CartViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setCart:(CartHandler*)newCart
{
    cart = newCart;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CartCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cartCell"];
    
    //cell.name = cart.
    
    return cell;
    
}

@end
