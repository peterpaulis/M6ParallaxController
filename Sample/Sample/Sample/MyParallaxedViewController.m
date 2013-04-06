//
//  MyViewController.m
//  Sample Storyboard
//
//  Created by Peter Paulis on 1.4.2013.
//  Copyright (c) 2013 Min60 s.r.o. - http://min60.com. All rights reserved.
//

#import "MyParallaxedViewController.h"

@interface MyParallaxedViewController ()

@property (weak, nonatomic) IBOutlet UIImageView * imageView;

@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UILabel *label3;

@end

@implementation MyParallaxedViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

////////////////////////////////////////////////////////////////////////
#pragma mark - Parallax Controller Delegate
////////////////////////////////////////////////////////////////////////

- (void)parallaxController:(M6ParallaxController *)parallaxController willChangeHeightOfViewController:(UIViewController *)viewController fromHeight:(CGFloat)oldHeight toHeight:(CGFloat)newHeight {

    if (newHeight >= parallaxController.parallaxedViewControllerStandartHeight) {
    
        [self.imageView setAlpha:1];
        [self.label1 setAlpha:1];
        [self.label2 setAlpha:1];
        [self.label3 setAlpha:1];
        
    } else {
    
        float r = newHeight / parallaxController.parallaxedViewControllerStandartHeight;
        [self.imageView setAlpha:r];
        [self.label1 setAlpha:r];
        [self.label2 setAlpha:r*r];
        [self.label3 setAlpha:r*r*r*r];
        
    }

}

@end
