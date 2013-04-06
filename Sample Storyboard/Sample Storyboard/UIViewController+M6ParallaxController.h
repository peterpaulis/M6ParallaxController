//
//  UIViewController+M6Parallax.h
//  M6ParallaxTableViewController
//
//  Created by Peter Paulis on 1.4.2013.
//  Copyright (c) 2013 Min60 s.r.o. - http://min60.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@class M6ParallaxController;

@interface UIViewController (M6ParallaxController)

@property (nonatomic, weak, readonly) M6ParallaxController * parallaxController;

@end
