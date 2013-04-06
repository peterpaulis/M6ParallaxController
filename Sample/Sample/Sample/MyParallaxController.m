//
//  ViewController.m
//  Sample Storyboard
//
//  Created by Peter Paulis on 1.4.2013.
//  Copyright (c) 2013 Min60 s.r.o. - http://min60.com. All rights reserved.
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
