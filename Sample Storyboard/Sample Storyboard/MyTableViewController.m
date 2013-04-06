//
//  MyTableViewController.m
//  Sample Storyboard
//
//  Created by Peter Paulis on 1.4.2013.
//  Copyright (c) 2013 Min60 s.r.o. - http://min60.com. All rights reserved.
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
