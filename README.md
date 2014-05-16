CINBouncyButton
===============

UIButton, but bouncier and capable for use with your own icons and attributed text.

Video of what she looks like in action can be found [here!](https://github.com/MaxKramer/CINBouncyButton/blob/master/BouncyButton.mp4?raw=true)

![Screenshot of the button](http://cl.ly/image/3R2h3z2P1A0g/Screen%20Shot%202014-05-16%20at%2023.23.58.png)

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

#Example Project

Make sure that you run `pod install` before attempting to build and run the project. 

Tacky Gif (Please see video instead!):

![Example](http://i.imgflip.com/8ss3c.gif)
