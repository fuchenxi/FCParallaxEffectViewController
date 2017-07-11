//
//  FCParallaxEffectViewController.m
//  FCParallaxEffectViewController
//
//  Created by 付晨曦 on 2017/7/11.
//  Copyright © 2017年 付晨曦. All rights reserved.
//

#import "FCParallaxEffectViewController.h"
#import "FCParallaxEffectView.h"
#import "FCMath.h"

@interface FCParallaxEffectViewController () <UIScrollViewDelegate>

@property (nonatomic, strong) NSArray *pictureArray;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) FCMath *onceLinearEquation;

@end

@implementation FCParallaxEffectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    FCMathPoint pointA = FCMathPointMake(0, 0);
    FCMathPoint pointB = FCMathPointMake(self.view.frame.size.width, 270 - 80);
    
    self.onceLinearEquation = [FCMath mathOnceLinearEquationWithPointA:pointA PointB:pointB];
    
    _pictureArray = @[[UIImage imageNamed:@"3"],
                      [UIImage imageNamed:@"2"],
                      [UIImage imageNamed:@"1"],
                      [UIImage imageNamed:@"4"],
                      [UIImage imageNamed:@"5"],
                      [UIImage imageNamed:@"6"]];
    
    _scrollView = ({
        
        UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
        scrollView.delegate = self;
        scrollView.bounces = NO;
        scrollView.pagingEnabled = YES;
        scrollView.backgroundColor = [UIColor whiteColor];
        for (int i = 0; i < _pictureArray.count; i++) {
            
            FCParallaxEffectView *view = [[FCParallaxEffectView alloc] initWithFrame:CGRectMake(i * self.view.bounds.size.width, 0, self.view.bounds.size.width, scrollView.bounds.size.height)];
            view.tag = 1000 + i;
            view.imageView.image = _pictureArray[i];
            [scrollView addSubview:view];
        }
        scrollView.contentSize = CGSizeMake(scrollView.bounds.size.width * _pictureArray.count, 0);
        [self.view addSubview:scrollView];
        scrollView;
    });
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    CGFloat offsetX = scrollView.contentOffset.x;
    for (int i = 0; i < _pictureArray.count; i++) {
        
        FCParallaxEffectView *view = [scrollView viewWithTag:1000 + i];
        CGRect rect = view.imageView.frame;
        rect.origin.x = _onceLinearEquation.k * (offsetX - i * scrollView.frame.size.width) + _onceLinearEquation.b;
        view.imageView.frame = rect;
    }
}

@end
