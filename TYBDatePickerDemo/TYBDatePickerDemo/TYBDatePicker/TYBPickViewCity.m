//
//  TYBPickViewCity.m
//  TYBDatePickerDemo
//
//  Created by 滕跃兵 on 16/2/18.
//  Copyright © 2016年 滕跃兵. All rights reserved.
//

#import "TYBPickViewCity.h"

@implementation TYBPickViewCity

- (NSArray *)data {
    
    NSMutableArray *array = [NSMutableArray array];
    if (self.provinces) {
        [array addObject:self.provinces];
    }
    if (self.municipalities) {
        [array addObject:self.municipalities];
    }
    if (self.counties) {
        [array addObject:self.counties];
    }
    return array;
}
@end
