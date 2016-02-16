//
//  ViewController.m
//  TYBDatePickerDemo
//
//  Created by 滕跃兵 on 16/1/21.
//  Copyright © 2016年 滕跃兵. All rights reserved.
//

#import "TYBPickView.h"
#import "ViewController.h"

@interface ViewController ()<TYBPickViewDelegate>

@property (nonatomic, strong) TYBPickView *picker;

@property (nonatomic, strong) NSArray *cities;

@end

@implementation ViewController

- (NSArray *)cities{
    if (_cities == nil) {
        _cities = @[@[@"111",@"222"],@[@"上海",@"北京",@"广州",@"深圳"]];
    }
    return _cities;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.picker = [[TYBPickView alloc]init];
    _picker.confirmDelegate = self;
    _picker.pickerMode = TYBPickViewTypeCustom;
    _picker.pickerData = self.cities;
    _picker.title = @"城市选择";
    
    [self.view addSubview:_picker];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (IBAction)show:(id)sender {
    [_picker show];
}


- (void)pickView:(TYBPickView *)pickView didClickButtonConfirm:(id)data {
    
   
    if (self.picker.pickerMode == TYBPickViewTypeCustom) {
        
        
        NSLog(@"%@",data);
    }else{
         NSLog(@"%@",data);
    }
  
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
