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
    
    UIViewController * topViewController = [MyTopViewController new];
    UITableViewController * tableViewController = [MyTableViewController new];
    
    [self setupWithTopViewController:topViewController height:150 tableViewController:tableViewController];
    
    UITapGestureRecognizer * tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)];
    tapGestureRecognizer.delegate = self;
    [self.view addGestureRecognizer:tapGestureRecognizer];

}

- (void)handleTapGesture:(id)sender {
    
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Yup" message:@"You pressed" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    [alert show];
    
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
    
    CGPoint tapPoint = [touch locationInView:self.view];
    if ([self.topViewController.view hitTest:tapPoint withEvent:nil]) {
        return YES;
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
