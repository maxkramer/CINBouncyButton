//
//  CINViewController.m
//  Example
//
//  Created by Max Kramer on 14/05/2014.
//  Copyright (c) 2014 Max Kramer. All rights reserved.
//

#import "CINViewController.h"
#import <CINBouncyButton/CINBouncyButton.h>
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@implementation CINViewController

- (void)viewDidLoad {
    CGSize buttonSize = CGSizeMake(250, 50);
    CGPoint padding = CGPointMake(40, 40);
    
    CINBouncyButton *twitterButton = [[CINBouncyButton alloc] initWithFrame:CGRectMake(padding.x, padding.y, buttonSize.width, buttonSize.height) image:[UIImage imageNamed:@"icon_twitter"] andTitle:[[NSAttributedString alloc] initWithString:@"Connect on Twitter!" attributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}]];
    [twitterButton setBackgroundColor:UIColorFromRGB(0x55ACEE)];
    [self.view addSubview:twitterButton];
    
    CINBouncyButton *facebookButton = [[CINBouncyButton alloc] initWithFrame:CGRectMake(padding.x, padding.y + CGRectGetMaxY(twitterButton.frame), buttonSize.width, buttonSize.height) image:[UIImage imageNamed:@"icon_facebook"] andTitle:[[NSAttributedString alloc] initWithString:@"Login via Facebook!" attributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}]];
    [facebookButton setBackgroundColor:UIColorFromRGB(0x3B5999)];
    [self.view addSubview:facebookButton];
    
    CINBouncyButton *anchorButton = [[CINBouncyButton alloc] initWithFrame:CGRectMake(padding.x, padding.y + CGRectGetMaxY(facebookButton.frame), buttonSize.width, buttonSize.height) image:[[UIImage imageNamed:@"01-anchor"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] andTitle:[[NSAttributedString alloc] initWithString:@"Sail - Awolnation?" attributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}]];
    [anchorButton setBackgroundColor:UIColorFromRGB(0xAABBCC)];
    [anchorButton setTintColor:[UIColor whiteColor]];
    [self.view addSubview:anchorButton];
    
    CINBouncyButton *refreshButton = [[CINBouncyButton alloc] initWithFrame:CGRectMake(padding.x, padding.y + CGRectGetMaxY(anchorButton.frame), buttonSize.width, buttonSize.height) image:[[UIImage imageNamed:@"01-refresh"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] andTitle:[[NSAttributedString alloc] initWithString:@"Refresh" attributes:@{NSForegroundColorAttributeName : [UIColor lightGrayColor]}]];
    [refreshButton setBackgroundColor:UIColorFromRGB(0xEEEEEE)];
    [refreshButton setTintColor:[UIColor lightGrayColor]];
    [self.view addSubview:refreshButton];
    [super viewDidLoad];
}

@end
