//
//  FCMath.m
//  FCParallaxEffectViewController
//
//  Created by 付晨曦 on 2017/7/11.
//  Copyright © 2017年 付晨曦. All rights reserved.
//

#import "FCMath.h"

@implementation FCMath

+ (instancetype)mathOnceLinearEquationWithPointA:(FCMathPoint)pointA PointB:(FCMathPoint)pointB {
    
    FCMath *equation = [[[self class] alloc] init];
    
    CGFloat x1 = pointA.x; CGFloat y1 = pointA.y;
    CGFloat x2 = pointB.x; CGFloat y2 = pointB.y;
    
    equation.k = calculateSlope(x1, y1, x2, y2);
    equation.b = calculateConstant(x1, y1, x2, y2);
    
    return equation;
}

CGFloat calculateSlope(CGFloat x1, CGFloat y1, CGFloat x2, CGFloat y2) {
    
    if (x2 == x1) return 0;
    return (y2 - y1) / (x2 - x1);
}

CGFloat calculateConstant(CGFloat x1, CGFloat y1, CGFloat x2, CGFloat y2) {
    
    if (x2 == x1) return 0;
    return (y1*(x2 - x1) - x1*(y2 - y1)) / (x2 - x1);
}

@end
