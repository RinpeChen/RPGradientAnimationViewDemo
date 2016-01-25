//
//  RPGradientAnimationView.h
//  CAGradientLayer实现色差动画
//
//  Created by RinpeChen on 16/1/25.
//  Copyright © 2016年 miaoqu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    RPGradientAnimationViewColorDirectionUpToDown               = 1,       // 从上到下
    RPGradientAnimationViewColorDirectionLeftToRight            = 2,       // 从左到右
    RPGradientAnimationViewColorDirectionDownToUp               = 3,       // 从下到上
    RPGradientAnimationViewColorDirectionRightToLeft            = 4,       // 从右到左
    RPGradientAnimationViewColorDirectionObliqueLeftToRigth     = 5,       // 对角线:左上到右下
    RPGradientAnimationViewColorDirectionObliqueRightToLeft     = 6        // 对角线:右上到左下
    
} RPGradientAnimationViewColorDirection;

@interface RPGradientAnimationView : UIImageView

/** 渐变色方向 */
@property (nonatomic, assign) RPGradientAnimationViewColorDirection colorDirection;
/** 颜色 */
@property (nonatomic, strong) UIColor *color;
/** 颜色百分比(非透明部分) 取值范围:0~1 */
@property (nonatomic, assign) CGFloat percent;


@end
