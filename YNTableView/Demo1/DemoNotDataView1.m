//
//  DemoNotDataView1.m
//  YNTableView
//
//  Created by ZYN on 17/1/23.
//  Copyright © 2017年 Yongneng Zheng. All rights reserved.
//

#import "DemoNotDataView1.h"

@implementation DemoNotDataView1

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        self.iconImageView.image = [UIImage imageNamed:@"no_data_katong_"];
        self.contentLabel.text = @"哎呀，服务器繁忙~请点击重新加载再试试哦";
        self.notDataViewType = YNBaseNotDataViewTypeAll;
        self.allowBackgroundTouch = YES;
    }
    return self;
}

@end
