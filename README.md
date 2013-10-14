M6ParallaxController
====================

Parallax controller for a parallaxed view and a table view

Version 1.1
- Perfect smooth scrolling, however table section headers are no longer fully supported
- Updated samples, with code to handle clicking on the top parallaxed view
- Changed handling of height change

##Usage (Without storyboards)

- see sample

##Storyboard Usage

- Add M6ParallaxTableViewController.h / .m and UIViewController+M6ParallaxController.h / .m to your project
- Create a new ViewController, which subclasses M6ParallaxController

``` objective-c
#import <UIKit/UIKit.h>
#import "M6ParallaxController.h"
            
@interface MyParallaxController : M6ParallaxController
            
@end
```

- In storyboard, create a view controller and set its class to MyParallaxController
- Add a UIViewController, which will be parallaxed. Set its Storyboard ID to let's say "ParallaxedViewController"
- Add a UITableViewController, and create a custom class for it, lets say MyTableViewController (which subclasses the UITableViewController). Inside your implementation of MyTableViewController add : 

``` objective-c
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    [self.parallaxController tableViewControllerDidScroll:self];
    
}
```

- Assign a StoryboardID to your MyTableViewController, let's say "MyTableViewController"
- In my MyParallaxController add

``` objective-c
-(void) awakeFromNib
{
    UIViewController * vc = [self.storyboard instantiateViewControllerWithIdentifier:@"ParallaxedViewController"];
    UITableViewController * tvc = [self.storyboard instantiateViewControllerWithIdentifier:@"MyTableViewController"];
    
    [self setupWithTopViewController:vc height:100 tableViewController:tvc];
}
```

##Special effects
- if you want to perform special action on resizing the parallaxed view (as in sample)
- in your custom subclass of M6ParallaxController overwrite this method

``` objective-c
- (void)willChangeHeightOfTopViewControllerFromHeight:(CGFloat)oldHeight toHeight:(CGFloat)newHeight;
```

- inside implement custom functionality (see sample)

##Tapping the top parallaxed controller
- to handle interaction on the top parallaxed controller, you need to add a tap gesture recognizer as in the sample
- to recognize tapping on a specific area, you will have to overwrite 
``` objective-c
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
```
and test for a specific area

- see storyboard sample for implementation example

#Tapping buttons in the top parallaxed controller

- the key is to add a gesture recognizer and test on the different buttons, than send the action to the button, and handle the click as it would come from a user
- see xib sample for implementationexample

``` objective-c
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
        
        ...
    }
    
    return NO;
}
```

##Table view sections
- these are no longer supported, to provide a better scrolling experience (however you can enable sections support in M6ParallaxController.m by uncommenting lines, but not that scrolling will not be so smooth)

##License
Apache License 2.0: http://www.apache.org/licenses/LICENSE-2.0.txt

##Issues
There may be an issue with using a navigation controller in that case use the following code. The problem is, that the frame changes, and is not final in viewDidLoad

``` objective-c
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
```

##Credits
min:60 - Building perfect mobile apps, for affordable price - <a href="https://min60.com">https://min60.com</a>


