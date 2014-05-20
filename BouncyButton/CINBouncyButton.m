//
//  CINBouncyButton.m
//  Cinetic
//
//  Created by Max Kramer on 10/04/2014.
//  Copyright (c) 2014 Max Kramer. All rights reserved.
//

#import "CINBouncyButton.h"

@interface CINBouncyButton ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation CINBouncyButton

#pragma mark - Initializers

- (id)initWithFrame:(CGRect)frame {
    return [self initWithFrame:frame image:nil andTitle:nil];
}

- (instancetype)initWithFrame:(CGRect)frame image:(UIImage *)image andTitle:(NSAttributedString *)title {
    if ((self = [super initWithFrame:frame])) {
        self.image = image;
        self.title = title;
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 5.0f;
        self.backgroundColor = [UIColor whiteColor];
        [self initialiseSubviews];
    }
    return self;
}

#pragma mark - Getters

- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    }
    return _titleLabel;
}

- (UIImageView *)imageView {
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    }
    return _imageView;
}

#pragma mark - Setters

- (void)setTitle:(NSAttributedString *)title {
    if (![_title isEqualToAttributedString:title]) {
        _title = title;
        [self.titleLabel setAttributedText:_title];
        [self layoutIfNeeded];
    }
}

- (void)setImage:(UIImage *)image {
    if (![_image isEqual:image]) {
        _image = image;
        [self.imageView setImage:image];
        [self layoutIfNeeded];
    }
}

#pragma mark - Content Layout

- (void)initialiseSubviews {
    [self addSubview:self.titleLabel];
    [self addSubview:self.imageView];
}

- (void)layoutSubviews {
    UIImage *image = self.imageView.image;
    
    [self.titleLabel sizeToFit];
    [self.titleLabel setFrame:CGRectMake((CGRectGetWidth(self.frame) - CGRectGetWidth(self.titleLabel.frame) + image.size.width) / 2, (CGRectGetHeight(self.frame) - CGRectGetHeight(self.titleLabel.frame)) / 2, CGRectGetWidth(self.titleLabel.frame), CGRectGetHeight(self.titleLabel.frame))];
    
    if (image) {
        CGRect imageViewFrame = self.imageView.frame;
        imageViewFrame.size = image.size;
        imageViewFrame.origin = CGPointMake(CGRectGetMinX(self.titleLabel.frame) - CGRectGetWidth(imageViewFrame) - 10, (CGRectGetHeight(self.frame) - CGRectGetHeight(imageViewFrame)) / 2);
        [self.imageView setFrame:imageViewFrame];
    }
}

#pragma mark - Animating

- (void)shrinkView {
    self.transform = CGAffineTransformMakeScale(0.9, 0.9);
    CABasicAnimation *shrink = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    shrink.fromValue = @(1.0);
    shrink.toValue = @(0.9);
    shrink.duration = 0.25;
    [self.layer addAnimation:shrink forKey:@"shrink"];
}

- (void)enlargeView {
    self.transform = CGAffineTransformIdentity;
    CABasicAnimation *enlarge = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    enlarge.fromValue = @(0.9);
    enlarge.toValue = @(1.0);
    enlarge.duration = 0.25;
    [self.layer addAnimation:enlarge forKey:@"enlarge"];
}

- (void)reduceBackgroundOpacity {
    UIColor *backgroundColor = self.backgroundColor;
    if (![backgroundColor isEqual:[UIColor clearColor]]) {
        CGFloat red, green, blue, alpha;
        [backgroundColor getRed:&red green:&green blue:&blue alpha:&alpha];
        if (alpha >= 0.8f) {
            alpha -= 0.2f;
        }
        [UIView animateWithDuration:0.25 animations:^{
            [self setBackgroundColor:[UIColor colorWithRed:red green:green blue:blue alpha:alpha]];
        }];
    }
}

- (void)increaseBackgroundOpacity {
    UIColor *backgroundColor = self.backgroundColor;
    CGFloat red, green, blue, alpha;
    [backgroundColor getRed:&red green:&green blue:&blue alpha:&alpha];
    if (alpha <= 0.8f) {
        alpha += 0.2f;
    }
    [UIView animateWithDuration:0.25 animations:^{
        [self setBackgroundColor:[UIColor colorWithRed:red green:green blue:blue alpha:alpha]];
    }];
}

#pragma mark - Touching

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    [self reduceBackgroundOpacity];
    [self shrinkView];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [self increaseBackgroundOpacity];
    [self enlargeView];
    [super touchesEnded:touches withEvent:event];
}

@end
