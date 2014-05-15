//
//  CINBouncyButton.h
//  Cinetic
//
//  Created by Max Kramer on 10/04/2014.
//  Copyright (c) 2014 Max Kramer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CINBouncyButton : UIControl

- (instancetype)initWithFrame:(CGRect)frame image:(UIImage *)image andTitle:(NSAttributedString *)title;

@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) NSAttributedString *title;

@end
