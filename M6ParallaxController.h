//
//  M6ParallaxTableViewController.h
//  M6ParallaxTableViewController
//
//  Created by Peter Paulis on 1.4.2013.
//  Copyright (c) 2013 Min60 s.r.o. - http://min60.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewController+M6ParallaxController.h"

@class M6ParallaxController;

@interface M6ParallaxController : UIViewController

@property (nonatomic, assign, readonly) CGFloat topViewControllerStandartHeight;

@property (nonatomic, strong, readonly) UIViewController * topViewController;
@property (nonatomic, strong, readonly) UITableViewController * tableViewController;

- (void)setupWithTopViewController:(UIViewController *)topViewController height:(CGFloat)height tableViewController:(UITableViewController *)tableViewController;

- (void)tableViewControllerDidScroll:(UITableViewController *)tableViewController;

// overwrite to provide custom functionality
- (void)willChangeHeightOfTopViewControllerFromHeight:(CGFloat)oldHeight toHeight:(CGFloat)newHeight;


@end
