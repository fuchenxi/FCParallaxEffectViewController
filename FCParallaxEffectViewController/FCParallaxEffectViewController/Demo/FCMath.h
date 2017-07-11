//
//  FCMath.h
//  FCParallaxEffectViewController
//
//  Created by 付晨曦 on 2017/7/11.
//  Copyright © 2017年 付晨曦. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

struct FCMathPoint {
    
    CGFloat x;
    CGFloat y;
    
};

typedef struct FCMathPoint FCMathPoint;

NS_INLINE FCMathPoint FCMathPointMake(CGFloat x, CGFloat y) {
    
    FCMathPoint p; p.x = x; p.y = y; return p;
}

@interface FCMath : NSObject

#pragma mark - Calculate once linear equation (Y = kX + b).

@property (nonatomic) CGFloat  k;
@property (nonatomic) CGFloat  b;

+ (instancetype)mathOnceLinearEquationWithPointA:(FCMathPoint)pointA PointB:(FCMathPoint)pointB;

@end
