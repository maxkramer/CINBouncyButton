CINBouncyButton
===============

UIButton, but bouncier and capable for use with your own icons and attributed text.

Video of what she looks like in action can be found [here!](https://github.com/MaxKramer/CINBouncyButton/blob/master/BouncyButton.mp4?raw=true)

#Installation
##Cocoapods

Simply add the following to your `Podfile`

    pod 'CINBouncyButton', '~>1.0.0'

##Manually

Copy the files `CINBouncyButton.{h,m}` to your project.

#Usage

Import the header, instantiate an instance of `CINBouncyButton`, add it as a subview, and feel your jaw drop in amazement.

```objc
#import "CINBouncyButton.h"
@implementation XYZ
- (void)viewDidLoad {
    UIImage *buttonImage = [UIImage imageNamed:@"icon_twitter"];
    NSAttributedString *buttonTitle = [[NSAttributedString alloc] initWithString:@"Connect on Twitter!" attributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    CINBouncyButton *twitterButton = [[CINBouncyButton alloc] initWithFrame:CGRectMake(40.0f, 40.0f, 250.0f, 40.0f) image:buttonImage andTitle:buttonTitle];
    [twitterButton setBackgroundColor:[UIColor blueColor]];
    [self.view addSubview:twitterButton];
    [super viewDidLoad];
}
@end
```    

Tacky Gif (Please see video instead!):

![Example](http://i.imgflip.com/8ss3c.gif)
