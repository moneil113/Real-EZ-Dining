//
//  CartTableViewController.m
//  EZ Dining
//
//  Created by Matthew O'Neil on 11/22/13.
//  Copyright (c) 2013 Matthew O'Neil. All rights reserved.
//

#import "CartTableViewController.h"
#import "CartHandler.h"
#import "CartCell.h"
#import "FoodItem.h"
#import "ViewController.h"
#import "ContainerViewController.h"

@interface CartTableViewController ()

@end

@implementation CartTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self update];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CartCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cartCell" forIndexPath:indexPath];
        
    FoodItem *tempfood = items[indexPath.row];

    cell.name.text = [tempfood getName];
    cell.priceLabel.text = [NSString stringWithFormat:@"$%.2f", [tempfood getPrice]];
    
    return cell;
}

- (void)setCart:(CartHandler*)newCart
{
    cart = newCart;
    items = [cart getCartItems];
}

- (void) setOwner:(ContainerViewController *)creator
{
    owner = creator;
}

- (void) update
{
    [self.tableView reloadData];
    [owner update];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [items removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [cart updateTotal];
        owner.totalPriceLabel.text = [NSString stringWithFormat:@"$%.2f",[cart getTotalPrice]];
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

@end
