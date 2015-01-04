//
//  TSActionSheet.h
//  faceRecoginize
//
//  Created by Tassel on 14/12/31.
//  Copyright (c) 2014年 Tassel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TSActionSheet : UIView

@property(nonatomic,strong) UIView *frontView;

- (void)showInView:(UIView *)view;
- (void)disMissActionSheet;

@end
