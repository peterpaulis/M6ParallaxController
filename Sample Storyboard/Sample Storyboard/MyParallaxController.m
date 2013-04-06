//
//  ViewController.m
//  Sample Storyboard
//
//  Created by Peter Paulis on 6.4.2013.
//  Copyright (c) 2013 Peter Paulis. All rights reserved.
//

#import "MyParallaxController.h"
#import "MyParallaxedViewController.h"

@interface MyParallaxController ()

@end

@implementation MyParallaxController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) awakeFromNib
{
    MyParallaxedViewController * vc = [self.storyboard instantiateViewControllerWithIdentifier:@"ParallaxedViewController"];
    UITableViewController * tvc = [self.storyboard instantiateViewControllerWithIdentifier:@"MyTableViewController"];
    
    [self setupWithViewController:vc height:100 tableViewController:tvc];
    
    self.delegate = vc;
    
}

@end
