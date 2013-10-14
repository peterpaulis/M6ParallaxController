//
//  ViewController.m
//  Sample Storyboard
//
//  Created by Peter Paulis on 1.4.2013.
//  Copyright (c) 2013 Min60 s.r.o. - http://min60.com. All rights reserved.
//

#import "MyMasterParallaxController.h"
#import "MyTopViewController.h"
#import "MyTableViewController.h"

@interface MyMasterParallaxController ()

@end

@implementation MyMasterParallaxController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    UITapGestureRecognizer * tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)];
    tapGestureRecognizer.delegate = self;
    [self.view addGestureRecognizer:tapGestureRecognizer];

}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        // setup
        {
            UIViewController * topViewController = [TopDesireViewController new];
            UITableViewController * tableViewController = [DesiresListingViewController new];
            
            [self setupWithTopViewController:topViewController height:230.f tableViewController:tableViewController];
            
        }
    });
    
}


- (void)handleTapGesture:(id)sender {
    
//    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Yup" message:@"You pressed" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
//    [alert show];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

////////////////////////////////////////////////////////////////////////
#pragma mark - TapGesture Delegate
////////////////////////////////////////////////////////////////////////

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    
    CGPoint tapPoint = [touch locationInView:self.view];;
    
    if (([self.topViewController.view hitTest:tapPoint withEvent:nil])) {
    
        MyTopViewController * mtvc = (MyTopViewController *)self.topViewController;
        
        // check for tap into button 1
        tapPoint = [touch locationInView:mtvc.button1];
        if ([mtvc.button1 hitTest:tapPoint withEvent:nil]) {
            [mtvc.button1 sendActionsForControlEvents:UIControlEventTouchUpInside];
            return YES;
        }
        
        // check for tap into button 2
        tapPoint = [touch locationInView:mtvc.button2];
        if ([mtvc.button2 hitTest:tapPoint withEvent:nil]) {
            [mtvc.button2 sendActionsForControlEvents:UIControlEventTouchUpInside];
            return YES;
        }
        
        // check for tap into button 3
        tapPoint = [touch locationInView:mtvc.button3];
        if ([mtvc.button3 hitTest:tapPoint withEvent:nil]) {
            [mtvc.button3 sendActionsForControlEvents:UIControlEventTouchUpInside];
            return YES;
        }
        
    }
    
    return NO;
}

////////////////////////////////////////////////////////////////////////
#pragma mark - Public
////////////////////////////////////////////////////////////////////////

- (void)willChangeHeightOfTopViewControllerFromHeight:(CGFloat)oldHeight toHeight:(CGFloat)newHeight {
    
    MyTopViewController * topViewController = (MyTopViewController *)self.topViewController;
    [topViewController willChangeHeightFromHeight:oldHeight toHeight:newHeight];
    
    float r = (self.topViewControllerStandartHeight * 1.5f) / newHeight;
    [self.tableViewController.view setAlpha:r*r*r*r*r*r];
    
}


@end
