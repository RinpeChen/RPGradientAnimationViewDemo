//
//  RPGradientAnimationView.m
//  CAGradientLayer实现色差动画
//
//  Created by RinpeChen on 16/1/25.
//  Copyright © 2016年 miaoqu. All rights reserved.
//

#import "RPGradientAnimationView.h"

@interface RPGradientAnimationView ()

// 渐变层
@property (nonatomic, strong) CAGradientLayer *gradientLayer;
// 背景图片
@property (nonatomic, weak) UIImageView *bgImageView;

@end

@implementation RPGradientAnimationView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        // 初始化渐变层
        self.gradientLayer = [CAGradientLayer layer];
        
        // 颜色组
        self.gradientLayer.colors = @[
                                      (id)[UIColor clearColor].CGColor,
                                      (id)[UIColor redColor].CGColor
                                      ];
        
        // 设置颜色分隔点
        self.gradientLayer.locations = @[@(1.f), @(1.f)];
        
        // 设置渐变方向
        self.gradientLayer.startPoint = CGPointMake(0, 0);
        self.gradientLayer.endPoint = CGPointMake(0, 1);
        
        // 添加渐变层
        [self.layer addSublayer:self.gradientLayer];
        
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.gradientLayer.frame = self.bounds;
}

- (void)setColor:(UIColor *)color
{
    _color = color;
    self.gradientLayer.colors = @[
                                  (id)[UIColor clearColor].CGColor,
                                  (id)color.CGColor
                                  ];
}

- (void)setColorDirection:(RPGradientAnimationViewColorDirection)colorDirection
{
    _colorDirection = colorDirection;
    CGPoint startPoint;
    CGPoint endPoint;
    switch (colorDirection) {
        case RPGradientAnimationViewColorDirectionUpToDown:
            startPoint = CGPointMake(0, 0);
            endPoint = CGPointMake(0, 1);
            break;
        case RPGradientAnimationViewColorDirectionLeftToRight:
            startPoint = CGPointMake(0, 0);
            endPoint = CGPointMake(1, 0);
            break;
        case RPGradientAnimationViewColorDirectionDownToUp:
            startPoint = CGPointMake(0, 1);
            endPoint = CGPointMake(0, 0);
            break;
        case RPGradientAnimationViewColorDirectionRightToLeft:
            startPoint = CGPointMake(1, 0);
            endPoint = CGPointMake(0, 0);
            break;
        case RPGradientAnimationViewColorDirectionObliqueLeftToRigth:
            startPoint = CGPointMake(0, 0);
            endPoint = CGPointMake(1, 1);
            break;
        case RPGradientAnimationViewColorDirectionObliqueRightToLeft:
            startPoint = CGPointMake(1, 0);
            endPoint = CGPointMake(0, 1);
            break;
        default:
            startPoint = CGPointMake(0, 0);
            endPoint = CGPointMake(0, 1);
            break;
    }
    self.gradientLayer.startPoint = startPoint;
    self.gradientLayer.endPoint = endPoint;
}

- (void)setPercent:(CGFloat)percent
{
    if (!(percent < 0 || percent > 1)) {
        _percent = percent;
        self.gradientLayer.locations = @[@(percent), @(1.f)];
    }
}

@end
