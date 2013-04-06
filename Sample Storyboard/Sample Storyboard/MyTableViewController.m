//
//  MyTableViewController.m
//  Sample Storyboard
//
//  Created by Peter Paulis on 6.4.2013.
//  Copyright (c) 2013 Peter Paulis. All rights reserved.
//

#import "MyTableViewController.h"
#import "M6ParallaxController.h"

@interface MyTableViewController ()

@end

@implementation MyTableViewController

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    [self.parallaxController tableViewControllerDidScroll:self];
    
}

@end
