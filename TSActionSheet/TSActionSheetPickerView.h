//
//  TSActionSheetPickerView.h
//  faceRecoginize
//
//  Created by Tassel on 14/12/31.
//  Copyright (c) 2014年 Tassel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TSActionSheet.h"

@class TSActionSheetPickerView;

@protocol TSActionSheetPickerViewDataSource <NSObject>

@required

- (NSInteger)numberOfComponentsInPickerView:(TSActionSheetPickerView *)pickerView;
- (NSInteger)pickerView:(TSActionSheetPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component;
- (NSString*) pickerView:(TSActionSheetPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component;

@end

@protocol TSActionSheetPickerViewDelegate <NSObject>

@optional
-(void)cancelSelect:(TSActionSheetPickerView *)pickerView;
-(void)doneSelect:(TSActionSheetPickerView *)pickerView currentRow:(NSInteger)row;

@end


@interface TSActionSheetPickerView : TSActionSheet

@property (nonatomic, assign)   id <TSActionSheetPickerViewDelegate>   delegate;
@property (nonatomic, assign)   id <TSActionSheetPickerViewDataSource>   dataSource;

@property(nonatomic,strong)UIView *toobarView;
@property(nonatomic,strong)UIButton *doneButton;
@property(nonatomic,strong)UIButton *cancelButton;
@property(nonatomic,strong) UIPickerView *pickerView;

@end
