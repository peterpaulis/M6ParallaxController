//
//  M6ParallaxTableViewController.m
//  M6ParallaxTableViewController
//
//  Created by Peter Paulis on 1.4.2013.
//  Copyright (c) 2013 Min60 s.r.o. - http://min60.com. All rights reserved.
//

#import "M6ParallaxController.h"

@interface M6ParallaxController ()

@property (nonatomic, strong, readwrite) UIViewController * topViewController;
@property (nonatomic, strong, readwrite) UITableViewController * tableViewController;

@property (nonatomic, assign, readwrite) CGFloat topViewControllerStandartHeight;

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

- (void)setupWithTopViewController:(UIViewController *)topViewController height:(CGFloat)height tableViewController:(UITableViewController *)tableViewController {
    
    self.topViewControllerStandartHeight = height;
    
    [tableViewController.tableView setBackgroundColor:[UIColor clearColor]];
    [tableViewController.tableView setBackgroundView:nil];
    [topViewController.view setClipsToBounds:YES];
    [tableViewController.view setClipsToBounds:YES];
    
    [self addChildViewController:topViewController];
    [self.view addSubview:topViewController.view];
    [topViewController didMoveToParentViewController:self];
    
    [self addChildViewController:tableViewController];
    [self.view addSubview:tableViewController.view];
    [tableViewController didMoveToParentViewController:self];
    
    tableViewController.tableView.frame = self.view.bounds;
    
    topViewController.view.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.topViewControllerStandartHeight);
    tableViewController.tableView.contentInset = UIEdgeInsetsMake(topViewController.view.frame.size.height, 0, 0, 0);
    
    self.topViewController = topViewController;
    self.tableViewController = tableViewController;
    
}

- (void)tableViewControllerDidScroll:(UITableViewController *)tableViewController {
    
    if (tableViewController != self.tableViewController) {
        return;
    }

    UITableView * tableView = self.tableViewController.tableView;
    UIView * parallaxView = self.topViewController.view;
    
    float y = tableView.contentOffset.y + self.topViewControllerStandartHeight;
    
    CGRect currentParallaxFrame = parallaxView.frame;
    
    if (y > 0) {
        
        CGFloat newHeight = self.topViewControllerStandartHeight - y;
        
        [parallaxView setHidden:(newHeight <= 0)];
        
        if (!parallaxView.hidden) {
            
            [self willChangeHeightOfTopViewControllerFromHeight:parallaxView.frame.size.height toHeight:newHeight];
            
            parallaxView.frame = CGRectMake(currentParallaxFrame.origin.x, currentParallaxFrame.origin.y, currentParallaxFrame.size.width, newHeight);
          
        }

        //uncomment if you want to support section headers - doesnt work 100%
//        if (y >= self.topViewControllerStandartHeight) {
//            
//            tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
//            
//        } else {
//            
//            tableView.contentInset = UIEdgeInsetsMake(self.topViewControllerStandartHeight - y, 0, 0, 0);
//            
//        }
        
    } else {
        
        [parallaxView setHidden:NO];
        
        CGFloat newHeight = self.topViewControllerStandartHeight - y;
        
        [self willChangeHeightOfTopViewControllerFromHeight:parallaxView.frame.size.height toHeight:newHeight];
        
        parallaxView.frame = CGRectMake(currentParallaxFrame.origin.x, currentParallaxFrame.origin.y, currentParallaxFrame.size.width, newHeight);

        //uncomment if you want to support section headers - doesnt work 100%
//        tableView.contentInset = UIEdgeInsetsMake(self.topViewControllerStandartHeight, 0, 0, 0);
        
    }
    
    [tableView setShowsVerticalScrollIndicator:parallaxView.hidden];
    
}

- (void)willChangeHeightOfTopViewControllerFromHeight:(CGFloat)oldHeight toHeight:(CGFloat)newHeight {

}


@end
