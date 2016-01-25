//
//  TYBPickView.m
//  TYBDatePickerDemo
//
//  Created by 滕跃兵 on 16/1/21.
//  Copyright © 2016年 滕跃兵. All rights reserved.
//

#import "TYBPickView.h"

#define deviceWidth [UIScreen mainScreen].bounds.size.width
#define deviceHeight [UIScreen mainScreen].bounds.size.height

@interface TYBPickView()
@property (weak, nonatomic) IBOutlet UIDatePicker *datepickView;
@property (weak, nonatomic) IBOutlet UILabel *titleLable;

@property (nonatomic, strong) NSDictionary *data;

@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;

//遮罩
@property (nonatomic, strong) UIView *maskView;


@end

@implementation TYBPickView

- (UIView *)maskView {
    if (_maskView == nil) {
        _maskView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, deviceWidth, deviceHeight-self.frame.size.height)];
        _maskView.backgroundColor =[UIColor colorWithWhite:0.2 alpha:0.3];
    }
    return _maskView;
}



- (NSDictionary *)data {
    if(_data == nil) {
        _data = [[NSDictionary alloc] init];
    }
    return _data;
}

- (instancetype)init {
    if (self = [super init]) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"TYBPickView" owner:nil options:nil] firstObject];
        self.frame = CGRectMake(0, deviceHeight, deviceWidth, 197);
       
        
    }
    return self;
}


- (void)setDataSource:(id<UIPickerViewDataSource>)dataSource {
    self.pickerView.dataSource = dataSource;
    
}


- (void)setDelegate:(id<UIPickerViewDelegate>)delegate {
    self.pickerView.delegate = delegate;
}


- (void)setPickerMode:(TYBPickViewType)pickerMode {
    _pickerMode = pickerMode;
    switch (pickerMode) {
        case TYBPickViewTypeDate:
            self.datepickView.datePickerMode = UIDatePickerModeDate;
            break;
        case TYBPickViewTypeTime:
            self.datepickView.datePickerMode = UIDatePickerModeTime;
            break;
        case TYBPickViewTypeDateAndTime:
            self.datepickView.datePickerMode = UIDatePickerModeDateAndTime;
            break;
        case TYBPickViewTypeCountDownTimer:
            self.datepickView.datePickerMode = UIDatePickerModeCountDownTimer;
            break;
        case TYBPickViewTypeCustom:
            self.datepickView.hidden = YES;
            self.pickerView.hidden = NO;
            break;
        default:
            break;
    }
}
- (void)setTitle:(NSString *)title {
    _title = title;
    self.titleLable.text = title;
}

- (void)show{
    
    [UIView animateWithDuration:0.5 animations:^{
        self.frame = CGRectMake(0, deviceHeight-197, deviceWidth, 197);
        
    }completion:^(BOOL finished) {
        [self.superview addSubview:self.maskView];
        
    }];
}

- (void)hide{
    [UIView animateWithDuration:0.5 animations:^{
        [self.maskView removeFromSuperview];
        self.frame = CGRectMake(0, deviceHeight, deviceWidth, 197);
    }completion:^(BOOL finished) {
        
    }];
    
    
}

- (IBAction)cancle:(id)sender {
    [self hide];
}


- (IBAction)confirm:(id)sender {
    
        if (self.pickerMode == TYBPickViewTypeCustom) {
            [self.confirmDelegate pickView:self didClickButtonConfirm:nil];
        }else{
            // 时区转换
            NSDate *date=[_datepickView date];
            NSTimeZone *timeZone=[NSTimeZone systemTimeZone];
            NSInteger seconds=[timeZone secondsFromGMTForDate:date];
            NSDate *newDate=[date dateByAddingTimeInterval:seconds];
            [self.confirmDelegate pickView:self didClickButtonConfirm:newDate];
        }
   
    
    [self hide];
}








@end
