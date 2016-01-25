//
//  ViewController.m
//  CAGradientLayer实现色差动画
//
//  Created by RinpeChen on 16/1/25.
//  Copyright © 2016年 miaoqu. All rights reserved.
//

#import "ViewController.h"
#import "RPGradientAnimationView.h"

#define RPRandomColor [UIColor colorWithRed:(arc4random_uniform(255))/255.0 green:(arc4random_uniform(255))/255.0 blue:(arc4random_uniform(255))/255.0 alpha:1.0]

@interface ViewController ()

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, weak) RPGradientAnimationView *gradientAnimationView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    RPGradientAnimationView *gradientAnimationView = [[RPGradientAnimationView alloc] init];
    gradientAnimationView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    gradientAnimationView.colorDirection = RPGradientAnimationViewColorDirectionUpToDown;
    gradientAnimationView.color = [UIColor redColor];
    gradientAnimationView.image = [UIImage imageNamed:@"开始图片"];
    gradientAnimationView.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:gradientAnimationView];
    self.gradientAnimationView = gradientAnimationView;
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.f target:self selector:@selector(startAnimation) userInfo:nil repeats:YES];
}

- (void)startAnimation
{
    self.gradientAnimationView.percent = arc4random() % 100 / 100.0;
    self.gradientAnimationView.color = RPRandomColor;
}

@end
