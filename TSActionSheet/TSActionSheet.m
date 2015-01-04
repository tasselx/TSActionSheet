//
//  TSActionSheet.m
//  faceRecoginize
//
//  Created by Tassel on 14/12/31.
//  Copyright (c) 2014年 Tassel. All rights reserved.
//

#import "TSActionSheet.h"

#define WINDOW_COLOR           [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4]
#define ANIMATE_DURATION       0.25f
#define FRONTVIEW_HIGHT        100.f
#define FRONTVIEW_BACKCOLOR    [UIColor whiteColor]

@interface TSActionSheet()<UIGestureRecognizerDelegate>

@end

@implementation TSActionSheet


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        self.backgroundColor = WINDOW_COLOR;
        self.userInteractionEnabled = YES;
        
        
        
        UIView *toobarView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 44)];
        [toobarView.layer setBorderColor:[[UIColor colorWithRed:225/255.0 green:225/255.0 blue:225/255.0 alpha:1] CGColor]];
        [toobarView.layer setBorderWidth:1.0f];
        [_frontView addSubview:toobarView];
        
        _frontView= [[UIView alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, 0)];
        _frontView.backgroundColor=FRONTVIEW_BACKCOLOR;
        [self addSubview:_frontView];
        
        [UIView animateWithDuration:ANIMATE_DURATION animations:^{
            [_frontView setFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height-frame.size.height, [UIScreen mainScreen].bounds.size.width, frame.size.height)];
        } completion:^(BOOL finished) {
        }];
        
        
        
        
        UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(disMissActionSheet)];
        tap.delegate=self;
        [self addGestureRecognizer:tap];        
        
    }
    return self;
}


-(void)disMissActionSheet
{
    __weak typeof(self) weakSelf = self;
    
    [UIView animateWithDuration:ANIMATE_DURATION animations:^{
        [_frontView setFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, 0)];
        
        __strong typeof(weakSelf) strongSelf = weakSelf;
        strongSelf.alpha = 0;
    } completion:^(BOOL finished) {
        if (finished) {
            
            __strong typeof(weakSelf) strongSelf = weakSelf;

            [strongSelf removeFromSuperview];
            
        }
    }];
    
    [self cancelHandle];
}
- (void)showInView:(UIView *)view
{
    // [[UIApplication sharedApplication].delegate.window.rootViewController.view addSubview:self];
    
    [[UIApplication sharedApplication].delegate.window addSubview:self];
    
}

#pragma mark -
-(void)cancelHandle
{


}


#pragma mark -

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    for (UIView *view in [_frontView subviews]) {
        if (touch.view== view) {
            return NO;
        }
    }

    return  YES;
}



@end
