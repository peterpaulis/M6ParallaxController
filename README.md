M6ParallaxController
====================

Parallax controller for a parallaxed view and a table view

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
    
    [self setupWithViewController:vc height:100 tableViewController:tvc];
}
```

##Optional Usage
- you can create a class for your parallaxed UIViewController and make it conform to the delegate method

``` objective-c
@interface MyParallaxedViewController : UIViewController<M6ParallaxMasterViewControllerDelegate>
```

- and than in MyParallaxController, assign it as delegate

``` objective-c
-(void) awakeFromNib
{
    MyParallaxedViewController * vc = [self.storyboard instantiateViewControllerWithIdentifier:@"ParallaxedViewController"];
    UITableViewController * tvc = [self.storyboard instantiateViewControllerWithIdentifier:@"MyTableViewController"];
    
    [self setupWithViewController:vc height:100 tableViewController:tvc];
    
    self.delegate = vc;
}
```

- and do some custom stuff, like change the Alpha (as in the sample)

``` objective-c
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
```

##License
Apache License 2.0: http://www.apache.org/licenses/LICENSE-2.0.txt

##Credits
min:60 - Building perfect mobile apps, for affordable price - <a href="https://min60.com">https://min60.com</a>


