//
//  FCParallaxEffectView.m
//  FCParallaxEffectViewController
//
//  Created by 付晨曦 on 2017/7/11.
//  Copyright © 2017年 付晨曦. All rights reserved.
//

#import "FCParallaxEffectView.h"

@implementation FCParallaxEffectView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        self.layer.masksToBounds = YES;
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        [self addSubview:_imageView];
    }
    return self;
}

@end
