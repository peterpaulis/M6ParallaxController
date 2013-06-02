//
//  MyTableViewController.m
//  Sample
//
//  Created by Peter Paulis on 6.4.2013.
//  Copyright (c) 2013 Peter Paulis. All rights reserved.
//

#import "MyTableViewController.h"
#import "M6ParallaxController.h"

@interface MyTableViewController ()

@end

@implementation MyTableViewController

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

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 35;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    
    UIView * white = [[UIView alloc] initWithFrame:CGRectMake(0, 0, cell.frame.size.width, cell.frame.size.height)];
    [white setBackgroundColor:[UIColor whiteColor]];
    
    [cell setBackgroundView:white];
    
    [cell.textLabel setText:@"Some text"];
    
    return cell;
}

#pragma mark - Table view delegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    [self.parallaxController tableViewControllerDidScroll:self];
    
}

@end
