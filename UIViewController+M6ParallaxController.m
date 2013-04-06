//
//  UIViewController+M6Parallax.m
//  M6ParallaxTableViewController
//
//  Created by Peter Paulis on 5.4.2013.
//  Copyright (c) 2013 Peter Paulis. All rights reserved.
//

#import "UIViewController+M6ParallaxController.h"

#import "M6ParallaxController.h"

@implementation UIViewController (M6ParallaxController)

- (M6ParallaxController *)parallaxMasterController {
    UIViewController *iter = self.parentViewController;
    while (iter) {
        if ([iter isKindOfClass:[M6ParallaxController class]]) {
            return (M6ParallaxController *)iter;
        } else if (iter.parentViewController && iter.parentViewController != iter) {
            iter = iter.parentViewController;
        } else {
            iter = nil;
        }
    }
    return nil;
}

@end
