//
//  sandfacViewController.m
//  EZ Dining
//
//  Created by Jason Krein on 11/5/13.
//  Copyright (c) 2013 DJMMEK POW. All rights reserved.
//

#import "sandfacViewController.h"
#import "BasicCell.h"
#import "CartHandler.h"
#import "ViewController.h"
#import <Parse/Parse.h>

@interface sandfacViewController ()
@property NSArray *foods;
@property NSMutableArray* allStrings;
@property NSMutableArray* filtered;
@property BOOL isFiltered;
@end

@implementation sandfacViewController

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
        self.allStrings = [[NSMutableArray alloc] initWithArray:foods];
        
        NSSortDescriptor *sortDescriptor;
        sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"foodName"
                                                     ascending:YES];
        NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
        NSArray *sortedArray = [self.allStrings sortedArrayUsingDescriptors:sortDescriptors];
        self.allStrings = [[NSMutableArray alloc] initWithArray: sortedArray];

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
    [query whereKey:@"restaurantName" equalTo:@"Sandwich Factory"];
    
    //Could use [query whereKey...] instead to constrain the array
    [query findObjectsInBackgroundWithTarget:self
                                    selector:@selector(loadPeopleCallback:error:)];
    
    
}

-(void)searchBar:(UISearchBar*)searchBar textDidChange:(NSString*)searchText
{
    if(searchText.length == 0)
    {
        self.isFiltered = NO;
    }else
    {
        self.isFiltered = YES;
        self.filtered = [[NSMutableArray alloc]init];
        
        for(int i = 0; i < self.allStrings.count; i += 1)
        {
            NSDictionary *dict = self.allStrings[i];
            NSString *str = [dict valueForKey:@"foodName"];
            NSRange stringRange = [str rangeOfString:searchText options:(NSCaseInsensitiveSearch)];
            if(stringRange.location != NSNotFound)
            {
                [self.filtered addObject:dict];
            }
        }
    }
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
    NSString *test;
    if(self.isFiltered)
    {
        test = @"Yep";
    }else
    {
        test = @"Nope";
    }
    
    if(self.isFiltered)
    {
        return self.filtered.count;
    }
    return [self.allStrings count];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    self.isFiltered = NO;
    [self.tableView reloadData];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"sandCell";
    BasicCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    PFObject* food;
    
    // Configure the cell...
    if(!self.isFiltered)
    {
        food = [self.allStrings objectAtIndex:indexPath.row];
    }else
    {
        food = [self.filtered objectAtIndex:indexPath.row];
    }
    
    
    
    // Configure the cell...
    cell.nameLabel.text = [NSString stringWithFormat:@"%@",food[@"foodName"]];
    cell.priceLabel.text = [NSString stringWithFormat:@"$%.2f", [food[@"foodPrice"] doubleValue]];
    [cell setPrice:[food[@"foodPrice"] doubleValue]];
    [cell setName:[NSString stringWithFormat:@"%@", food[@"foodName"]]];
    
    
    ViewController* view = (ViewController*) self.parentViewController;
    CartHandler* cart = view.getCart;
    float moneyLeft = cart.getAmountRemaining;
    
    
    if([food[@"foodPrice"] doubleValue] > moneyLeft)
    {
        cell.contentView.backgroundColor = [UIColor lightGrayColor];
        cell.nameLabel.backgroundColor = [UIColor lightGrayColor];
    }
    else
    {
        cell.contentView.backgroundColor = [UIColor whiteColor];
        cell.nameLabel.backgroundColor = [UIColor whiteColor];
    }
    
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
