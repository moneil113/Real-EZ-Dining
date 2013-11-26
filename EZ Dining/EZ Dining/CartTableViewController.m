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

@interface CartTableViewController ()

@end

@implementation CartTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
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
    [self.tableView reloadData];
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
    return [[cart getCartItems] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CartCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cartCell"];
    
    if (cell == nil) {
        cell = [[CartCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cartCell"];
    }
    
    NSMutableArray *items = [cart getCartItems];

    FoodItem *tempfood = [items objectAtIndex:indexPath.row];

    if ([items count] == 0) {
        NSLog(@"Cart is empty");
    } else {
        NSLog([NSString stringWithFormat:@"cell: %i", indexPath.row]);
        cell.name.text = [tempfood getName];
        cell.quantityLabel.text = [NSString stringWithFormat:@"%d",[tempfood getQuantity]];
        cell.priceLabel.text = [NSString stringWithFormat:@"$%.2f", [tempfood getQuantity] * [tempfood getPrice]];
    }
    
    return cell;
}

- (void)setCart:(CartHandler*)newCart
{
    cart = newCart;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
