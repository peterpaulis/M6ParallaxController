//
//  M6ParallaxTableViewController.m
//  M6ParallaxTableViewController
//
//  Created by Peter Paulis on 5.4.2013.
//  Copyright (c) 2013 Peter Paulis. All rights reserved.
//

#import "M6ParallaxController.h"

@interface M6ParallaxController ()

@property (nonatomic, strong) UIViewController * viewController;
@property (nonatomic, strong) UITableViewController * tableViewController;

@property (nonatomic, assign) CGFloat viewControllerHeight;

@end

@implementation M6ParallaxController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

////////////////////////////////////////////////////////////////////////
#pragma mark - Public
////////////////////////////////////////////////////////////////////////

- (void)setupWithViewController:(UIViewController *)viewController height:(CGFloat)height tableViewController:(UITableViewController *)tableViewController {
    
    self.viewControllerHeight = height;
    
    [tableViewController.tableView setBackgroundColor:[UIColor clearColor]];
    [tableViewController.tableView setBackgroundView:nil];
    [viewController.view setClipsToBounds:YES];
    [tableViewController.view setClipsToBounds:YES];
    
    [self addChildViewController:viewController];
    [viewController didMoveToParentViewController:self];
    
    [self addChildViewController:tableViewController];
    [tableViewController didMoveToParentViewController:self];
    
    [self.view addSubview:viewController.view];
    [self.view addSubview:tableViewController.view];
    
    tableViewController.tableView.frame = self.view.bounds;
    
    viewController.view.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.viewControllerHeight);
    tableViewController.tableView.contentInset = UIEdgeInsetsMake(viewController.view.frame.size.height, 0, 0, 0);
    
    self.viewController = viewController;
    self.tableViewController = tableViewController;
    
}

- (void)tableViewControllerDidScroll:(UITableViewController *)tableViewController {
    
    if (tableViewController != self.tableViewController) {
        return;
    }

    UITableView * tableView = self.tableViewController.tableView;
    UIView * parallaxView = self.viewController.view;
    
    float y = tableView.contentOffset.y + self.viewControllerHeight;
    
    CGRect currentParallaxFrame = parallaxView.frame;
    
    if (y > 0) {
        
        CGFloat newHeight = self.viewControllerHeight - y;
        
        [parallaxView setHidden:(newHeight <= 0)];
        
        if (!parallaxView.hidden) {
            
            [self.delegate parallaxController:self willChangeHeightOfViewController:self.viewController fromHeight:parallaxView.frame.size.height toHeight:newHeight];
            
            parallaxView.frame = CGRectMake(currentParallaxFrame.origin.x, currentParallaxFrame.origin.y, currentParallaxFrame.size.width, newHeight);
          
        }
        
        if (y >= self.viewControllerHeight) {
            
            tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
            
        } else {
            
            tableView.contentInset = UIEdgeInsetsMake(self.viewControllerHeight - y, 0, 0, 0);
            
        }
        
    } else {
        
        [parallaxView setHidden:NO];
        
        parallaxView.frame = CGRectMake(currentParallaxFrame.origin.x, currentParallaxFrame.origin.y, currentParallaxFrame.size.width, self.viewControllerHeight - y);
        
        tableView.contentInset = UIEdgeInsetsMake(self.viewControllerHeight, 0, 0, 0);
        
    }
    
    [tableView setShowsVerticalScrollIndicator:parallaxView.hidden];
    
}


@end
