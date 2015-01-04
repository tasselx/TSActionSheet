//
//  ViewController.m
//  TSActionSheet
//
//  Created by Tassel on 15/1/4.
//  Copyright (c) 2015年 Tassel. All rights reserved.
//

#import "ViewController.h"
#import "TSActionSheetPickerView.h"

@interface ViewController ()<TSActionSheetPickerViewDelegate>
{
    TSActionSheetPickerView *actionSheetPicker;

}
- (IBAction)show:(UIButton *)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];

   
}


- (NSInteger)numberOfComponentsInPickerView:(TSActionSheetPickerView *)pickerView
{
    
    return 1;
    
}
- (NSInteger)pickerView:(TSActionSheetPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    
    return 4;
    
}

-(NSString*) pickerView:(TSActionSheetPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSLog(@"-----%d",row);
    
    return @"天朗民居";
}
-(void)doneSelect:(TSActionSheetPickerView *)pickerView currentRow:(NSInteger)row;

{
    actionSheetPicker=nil;
    NSLog(@"current Row ----%d",row);
    
}
-(void)cancelSelect:(TSActionSheetPickerView *)pickerView
{
    actionSheetPicker=nil;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)show:(UIButton *)sender {
    
   
    actionSheetPicker=[[TSActionSheetPickerView alloc] initWithFrame:CGRectMake(0, 0, 0, 260)];
    actionSheetPicker.delegate=self;

    [actionSheetPicker showInView:self.view];

}


@end
