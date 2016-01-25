//
//  ViewController.m
//  TYBDatePickerDemo
//
//  Created by 滕跃兵 on 16/1/21.
//  Copyright © 2016年 滕跃兵. All rights reserved.
//

#import "TYBPickView.h"
#import "ViewController.h"

@interface ViewController ()<UIPickerViewDataSource,UIPickerViewDelegate,TYBPickViewDelegate>

@property (nonatomic, strong) TYBPickView *picker;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    self.pickView.showsSelectionIndicator = YES;
    self.picker = [[TYBPickView alloc]init];
    _picker.confirmDelegate = self;
    _picker.pickerMode = TYBPickViewTypeTime;
    _picker.delegate = self;
    _picker.dataSource = self;
    
    [self.view addSubview:_picker];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (IBAction)show:(id)sender {
    [_picker show];
}

- (void)pickView:(TYBPickView *)pickView didClickButtonConfirm:(id)data {
    NSLog(@"%@",data);
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 3;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return 3;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return @"111";
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    NSLog(@"%ld")
}


// 当用户点击非picker区域时,退出
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = touches.anyObject;
    CGPoint point = [touch locationInView:self.view];
    if (CGRectContainsPoint(self.picker.frame, point)) {
        
    }else{
        [_picker hide];
    }
}

@end
