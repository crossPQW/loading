//
//  UWActivityIndicatorAnimation.m
//  ActivityIndicator
//
//  Created by 黄少华 on 16/3/17.
//  Copyright © 2016年 Lynn. All rights reserved.
//

#define kDuration 1.f
#import "SHActivityIndicatorAnimation.h"

@implementation SHActivityIndicatorAnimation

-(void)setupAnimationInLayer:(CALayer *)layer size:(CGSize)size color:(UIColor *)tintColor {
    CGFloat circleSpacing = -2;
    CGFloat circleSize = (size.width - 4 * circleSpacing) / 5;
    CGFloat x = (layer.bounds.size.width - size.width) / 2;
    CGFloat y = (layer.bounds.size.height - size.height) / 2;
    CFTimeInterval beginTime = CACurrentMediaTime();
    
    //animtion
    CAAnimationGroup *animation = [[CAAnimationGroup alloc] init];
    animation.animations = @[[self scaleAnimation], [self opactityAnimation]];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    animation.duration = kDuration;
    animation.repeatCount = HUGE;
    animation.removedOnCompletion = NO;
    
    //draw circle
    for (int i = 0; i < 8; i++) {
        CALayer *circle = [self circleLayerWithAngle:M_PI_4 * i size:circleSize origin:CGPointMake(x, y) containerSize:size color:tintColor];
        
        animation.beginTime = beginTime + i * 0.12;
        [circle addAnimation:animation forKey:@"animation"];
        [layer addSublayer:circle];
    }
}


- (CALayer *)circleLayerWithAngle:(CGFloat)angle size:(CGFloat)size origin:(CGPoint)origin containerSize:(CGSize)containerSize  color:(UIColor *)color{
    CGFloat raduis = containerSize.width * 0.5;
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    UIBezierPath *path = [[UIBezierPath alloc] init];
    
    [path addArcWithCenter:CGPointMake(size * 0.5, size * 0.5) radius:size * 0.5 startAngle:0 endAngle:M_PI * 2 clockwise:NO];
    [path closePath];
    layer.fillColor = color.CGColor;
    layer.path = path.CGPath;
    
    CGRect frame = CGRectMake(origin.x + raduis * (cos(angle) + 1),
                              origin.y + raduis * (sin(angle) + 1),
                              size, size);
    layer.frame = frame;
    return layer;
}

//scale
- (CAKeyframeAnimation *)scaleAnimation {
    CAKeyframeAnimation *scaleAnimate = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimate.keyTimes = @[@0, @0.5, @1];
    scaleAnimate.values = @[@1, @0.4, @1];
    scaleAnimate.duration = kDuration;
    return scaleAnimate;
}

//opactity
- (CAKeyframeAnimation *)opactityAnimation {
    CAKeyframeAnimation *opacityAnimaton = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    opacityAnimaton.keyTimes = @[@0, @0.5, @1];
    opacityAnimaton.values = @[@1, @0.3, @1];
    opacityAnimaton.duration = kDuration;
    return opacityAnimaton;
}
@end
