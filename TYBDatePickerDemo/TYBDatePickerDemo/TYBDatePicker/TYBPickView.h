//
//  TYBPickView.h
//  TYBDatePickerDemo
//
//  Created by 滕跃兵 on 16/1/21.
//  Copyright © 2016年 滕跃兵. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef enum : NSUInteger {
    TYBPickViewTypeCustom, // 用户自定义,自己设置代理,自己设置数据源
    TYBPickViewTypeTime, // 时间
    TYBPickViewTypeDate, // 日期
    TYBPickViewTypeCountDownTimer,// 显示分钟与秒
    TYBPickViewTypeDateAndTime // 日期和时间
} TYBPickViewType;



@class TYBPickView;

@protocol TYBPickViewDelegate <NSObject>

- (void)pickView:(TYBPickView *)pickView didClickButtonConfirm:(id)data;

@end

@interface TYBPickView : UIView

/**
 *  设置pickerView的类型
 */
@property (nonatomic, assign) TYBPickViewType pickerMode;

/**
 *  标题
 */
@property (nonatomic, copy) NSString *title;

/**
 *  用户自定义时,需要设置的属性
 */
@property (nonatomic, weak) id<UIPickerViewDataSource> dataSource;
/**
 *  用户自定义时,需要设置的属性
 */
@property (nonatomic, weak) id<UIPickerViewDelegate> delegate;

/**
 *  监听点击Confirm按钮的事件
 */
@property (nonatomic, weak) id<TYBPickViewDelegate> confirmDelegate;


- (instancetype)init;

/**
 *  弹出
 */
- (void)show;

/**
 *  隐藏
 */
- (void)hide;


@end
