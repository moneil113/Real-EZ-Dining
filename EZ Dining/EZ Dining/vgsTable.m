//
//  vgsTable.m
//  EZ Dining
//
//  Created by Matthew O'Neil on 11/27/13.
//  Copyright (c) 2013 Matthew O'Neil. All rights reserved.
//

#import "vgsTable.h"
#import "BasicCell.h"
#import <Parse/Parse.h>

@interface vgsTable ()
@property NSArray *foods;
@end

@implementation vgsTable

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    self.dataSource = self;
    self.delegate = self;
    
    return self;
}

-(void) loadPeopleCallback: (NSArray*) foods error:(NSError*) error
{
    if (!error)
    {
        self.foods = foods;
        [self reloadData];
    }
}

- (void)viewDidLoad
{
    //[super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [Parse setApplicationId:@"UVgPnay3gDOO8hRHbtu2ftCTwGLbD9h24f9QJ487"
                  clientKey:@"FE0DrPeDiGJI4iIGYkpziVn4nmGEW1ogyEIhEyXS"];
    
    
    PFQuery *query = [PFQuery queryWithClassName:@"allData"];
    [query whereKey:@"restaurantName" equalTo:@"VGs"];
    
    //Could use [query whereKey...] instead to constrain the array
    [query findObjectsInBackgroundWithTarget:self
                                    selector:@selector(loadPeopleCallback:error:)];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSections
{
    
    // Return the number of sections.
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.foods.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"vgsCell";
    BasicCell *cell = [self dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    PFObject *food = self.foods[indexPath.row];
    
    
    // Configure the cell...
    cell.nameLabel.text = [NSString stringWithFormat:@"%@",food[@"foodName"]];
    cell.priceLabel.text = [NSString stringWithFormat:@"$%.2f", [food[@"foodPrice"] doubleValue]];
    [cell setPrice:[food[@"foodPrice"] doubleValue]];
    [cell setName:[NSString stringWithFormat:@"%@", food[@"foodName"]]];
    
    
    return cell;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
