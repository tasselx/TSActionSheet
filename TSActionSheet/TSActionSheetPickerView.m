//
//  TSActionSheetPickerView.m
//  faceRecoginize
//
//  Created by Tassel on 14/12/31.
//  Copyright (c) 2014年 Tassel. All rights reserved.
//

#import "TSActionSheetPickerView.h"

@interface TSActionSheetPickerView()<UIPickerViewDataSource,UIPickerViewDelegate>

@property(nonatomic,strong) UIPickerView *pickerView;
@property(nonatomic) NSInteger currentRow;
@end

@implementation TSActionSheetPickerView



- (void)setDelegate:(id<TSActionSheetPickerViewDelegate>)delegate
{
    

    _delegate=delegate;
    [self setupPickerView];


}


-(void)setupPickerView
{

    UIView *toobarView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frontView.frame), 44)];
    [toobarView.layer setBorderColor:[[UIColor colorWithRed:225/255.0 green:225/255.0 blue:225/255.0 alpha:1] CGColor]];
    [toobarView.layer setBorderWidth:.5f];
    [self.frontView addSubview:toobarView];
    
    UIButton *doneButton=[UIButton buttonWithType:UIButtonTypeCustom];
    [doneButton addTarget:self action:@selector(handleDone:) forControlEvents:UIControlEventTouchUpInside];
    doneButton.titleLabel.font=[UIFont systemFontOfSize:15];
    [doneButton setTitleColor:[UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1] forState:UIControlStateNormal];
    [doneButton setTitle:@"完成" forState:UIControlStateNormal];
    [doneButton setFrame:CGRectMake(toobarView.frame.size.width-44,10, 44, 24)];
    [toobarView addSubview:doneButton];
    
    UIButton *cancelButton=[UIButton buttonWithType:UIButtonTypeCustom];
    [cancelButton addTarget:self action:@selector(handleCancel:) forControlEvents:UIControlEventTouchUpInside];
    cancelButton.titleLabel.font=[UIFont systemFontOfSize:15];
    [cancelButton setTitleColor:[UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1] forState:UIControlStateNormal];
    [cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    [cancelButton setFrame:CGRectMake(10,10, 44, 24)];
    [toobarView addSubview:cancelButton];
    
    UIPickerView *pickerView=[[UIPickerView alloc] initWithFrame:CGRectMake(0, 44, CGRectGetWidth(self.frontView.frame), CGRectGetHeight(self.frontView.frame))];
   
    pickerView.delegate=self;
    pickerView.dataSource=self;
    
    _pickerView=pickerView;
    pickerView=nil;
    [self.frontView addSubview:_pickerView];


}


-(void) handleDone:(UIButton *)aBtutton
{
    [self.delegate doneSelect:self currentRow:_currentRow];
    [self disMissActionSheet];

}

-(void) handleCancel:(UIButton *)aButton
{
    [self.delegate cancelSelect:self];
    [self disMissActionSheet];
    
}

-(void)cancelHandle
{

    [self.delegate cancelSelect:self];

}

#pragma mark - 
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{

    return 30;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{

    return [self.delegate numberOfComponentsInPickerView:self];
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{

    return [self.delegate pickerView:self numberOfRowsInComponent:component];
}

-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{

    UILabel* tView = (UILabel*)view;
    if (!tView)
    {
        tView = [[UILabel alloc] init];
        [tView setFont:[UIFont fontWithName:@"Helvetica" size:14]];
        [tView setTextAlignment:NSTextAlignmentCenter];
        tView.numberOfLines=3;
    }
    tView.text=[self.delegate pickerView:self titleForRow:row forComponent:component];
    return tView;

}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{

    _currentRow=row;

}

@end
