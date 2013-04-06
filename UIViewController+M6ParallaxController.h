//
//  UIViewController+M6Parallax.h
//  M6ParallaxTableViewController
//
//  Created by Peter Paulis on 5.4.2013.
//  Copyright (c) 2013 Peter Paulis. All rights reserved.
//

#import <UIKit/UIKit.h>

@class M6ParallaxController;

@interface UIViewController (M6ParallaxController)

@property (nonatomic, weak, readonly) M6ParallaxController * parallaxMasterController;

@end
