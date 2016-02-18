//
//  TYBPickViewCity.h
//  TYBDatePickerDemo
//
//  Created by 滕跃兵 on 16/2/18.
//  Copyright © 2016年 滕跃兵. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TYBPickViewCity : NSObject


// 省  层次结构自己定
@property (nonatomic, strong) NSArray *provinces;
// 市
@property (nonatomic, strong) NSArray *municipalities;
// 区/县
@property (nonatomic, strong) NSArray *counties;

@property (nonatomic, strong, readonly) NSArray *data;

@end
