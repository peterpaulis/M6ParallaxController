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

@protocol M6ParallaxMasterViewControllerDelegate <NSObject>

- (void)parallaxController:(M6ParallaxController *)parallaxController willChangeHeightOfViewController:(UIViewController *)viewController fromHeight:(CGFloat)oldHeight toHeight:(CGFloat)newHeight;

@end

@interface M6ParallaxController : UIViewController

@property (nonatomic, weak) id<M6ParallaxMasterViewControllerDelegate> delegate;

@property (nonatomic, assign, readonly) CGFloat parallaxedViewControllerStandartHeight;

- (void)setupWithViewController:(UIViewController *)viewController height:(CGFloat)height tableViewController:(UITableViewController *)tableViewController;

- (void)tableViewControllerDidScroll:(UITableViewController *)tableViewController;

@end
