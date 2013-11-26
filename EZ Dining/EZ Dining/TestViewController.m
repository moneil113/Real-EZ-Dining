//
//  TestViewController.m
//  EZ Dining
//
//  Created by Jason Krein on 11/26/13.
//  Copyright (c) 2013 Matthew O'Neil. All rights reserved.
//

#import "TestViewController.h"
#import <Parse/Parse.h>
#import "BasicCell.h"

@interface TestViewController ()
@property NSArray *foods;
@property NSMutableArray* allStrings;
@property NSMutableArray* filtered;
@property BOOL isFiltered;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@end

@implementation TestViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) loadPeopleCallback: (NSArray*) foods error:(NSError*) error
{
    if (!error)
    {
        self.foods = foods;
        self.allStrings = [[NSMutableArray alloc] initWithArray:foods];
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
    [query whereKey:@"restaurantName" equalTo:@"Tacos To Go"];
    
    //Could use [query whereKey...] instead to constrain the array
    [query findObjectsInBackgroundWithTarget:self
                                    selector:@selector(loadPeopleCallback:error:)];
    
    
}
- (UITableView*) searchResultsTableView
{
    return self.tableView;
}

- (void) searchDisplayControllerDidBeginSearch:(UISearchDisplayController *)controller
{
    CGRect newFrame = self.searchBar.frame;
    
    newFrame.origin.y = 0;
    
    self.searchBar.frame = newFrame;
}

- (void) searchDisplayControllerDidEndSearch:(UISearchDisplayController *)controller
{
    
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

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"tacosCell2";
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
    cell.priceLabel.text = [NSString stringWithFormat:@"$%@", food[@"foodPrice"]];
    [cell setPrice:[food[@"foodPrice"] doubleValue]];
    
    return cell;
}

@end
