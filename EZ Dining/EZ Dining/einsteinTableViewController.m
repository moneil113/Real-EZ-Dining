//
//  einsteinTableViewController.m
//  EZ Dining
//
//  Created by Jason Krein on 11/7/13.
//  Copyright (c) 2013 DJMMEK POW. All rights reserved.
//

#import "einsteinTableViewController.h"
#import "BasicCell.h"
#import <Parse/Parse.h>

@interface einsteinTableViewController ()
@property NSArray *foods;
@end

@implementation einsteinTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}


-(void) loadPeopleCallback: (NSArray*) foods error:(NSError*) error
{
    if (!error)
    {
        self.foods = foods;
        [self.tableView reloadData];
    }
}



- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [Parse setApplicationId:@"UVgPnay3gDOO8hRHbtu2ftCTwGLbD9h24f9QJ487"
                  clientKey:@"FE0DrPeDiGJI4iIGYkpziVn4nmGEW1ogyEIhEyXS"];
    
    
    PFQuery *query = [PFQuery queryWithClassName:@"allData"];
    [query whereKey:@"restaurantName" equalTo:@"Einstein Bros Bagels"];
    
    //Could use [query whereKey...] instead to constrain the array
    [query findObjectsInBackgroundWithTarget:self
                                    selector:@selector(loadPeopleCallback:error:)];
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
    return self.foods.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BasicCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"einsteinCell" forIndexPath:indexPath];
    
    // Configure the cell...
    PFObject *food = self.foods[indexPath.row];
    
    
    // Configure the cell...
    cell.nameLabel.text = [NSString stringWithFormat:@"%@",food[@"foodName"]];
    cell.priceLabel.text = [NSString stringWithFormat:@"$%@", food[@"foodPrice"]];
    [cell setPrice:[food[@"foodPrice"] doubleValue]];
    
    return cell;
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
