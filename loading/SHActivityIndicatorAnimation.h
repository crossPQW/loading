//
//  UWActivityIndicatorAnimation.h
//  ActivityIndicator
//
//  Created by 黄少华 on 16/3/17.
//  Copyright © 2016年 Lynn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SHActivityIndicatorAnimation : NSObject

-(void)setupAnimationInLayer:(CALayer *)layer size:(CGSize)size color:(UIColor *)tintColor;

@end
