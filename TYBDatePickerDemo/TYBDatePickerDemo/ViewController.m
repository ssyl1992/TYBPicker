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
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"Cities.plist" ofType:nil];
//    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:path];
}
- (IBAction)showTimePicker:(id)sender {
 
    self.picker = [[TYBPickView alloc] initWithMode:TYBPickViewTypeDateAndTime target:self title:@"时间选择"];
    [self.view addSubview:_picker];
    [self.picker showInController:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (IBAction)show:(id)sender {
    
    self.picker = [[TYBPickView alloc] initWithMode:TYBPickViewTypeCity target:self title:@"城市选择"];
    TYBPickViewCity *city = [[TYBPickViewCity alloc]init];
    city.provinces = @[@"上海",@"北京"];
    city.municipalities = @[@"111",@"222"];
//    city.counties = @[@"aaa",@"bbb"];
    
    _picker.pickerDataCity = city;
    

//    _picker.pickerDataCustom = self.cities;
    [self.view addSubview:_picker];
    [_picker showInController:self];
}


- (void)pickView:(TYBPickView *)pickView didClickButtonConfirm:(id)data {
    
    if (self.picker.pickerMode == TYBPickViewTypeCustom) {
        NSLog(@"%@",data);
    }else{
         NSLog(@"%@",data);
     
    }
  
}

- (void)pickViewCity:(TYBPickView *)pickView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
//    NSLog(@"row=%ld com = %ld",row,component);
    if (component == 0 && row == 1) {
          _picker.pickerDataCity.municipalities = @[@"ccc",@"2222",@"3333"];
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
