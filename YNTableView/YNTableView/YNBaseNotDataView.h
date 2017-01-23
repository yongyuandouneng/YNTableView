//
//  YNBaseNotDataView.h
//  052_对UITableView_UICollectionView封装
//
//  Created by ZYN on 17/1/22.
//  Copyright © 2017年 Yongneng Zheng. All rights reserved.
//  无数据页面

#import <UIKit/UIKit.h>

typedef void(^ReloadButtonBlock) (void);
typedef void(^BackgroundTouchBlock) (void);

typedef NS_ENUM(NSInteger, YNBaseNotDataViewType) {
    YNBaseNotDataViewTypeAll = 0,
    YNBaseNotDataViewTypeImage = 1,
    YNBaseNotDataViewTypeLabel = 2,
    YNBaseNotDataViewTypeButton = 3,
    YNBaseNotDataViewTypeImageAndLabel = 4,
    YNBaseNotDataViewTypeImageAndButton = 5,
    YNBaseNotDataViewTypeLabelAndButton = 6,
    
};

@interface YNBaseNotDataView : UIView
/// 内容
@property (nonatomic, strong) UIView *contentView;
/// 图片
@property (nonatomic, strong) UIImageView *iconImageView;
/// 文本
@property (nonatomic, strong) UILabel *contentLabel;
/// 按钮
@property (nonatomic, strong) UIButton *reloadButton;
/// 按钮点击回调
@property (nonatomic, copy) ReloadButtonBlock reloadButtonBlock;
/// 视图类型
@property (nonatomic, assign) YNBaseNotDataViewType notDataViewType;
/// 图片大小
@property (nonatomic, assign) CGSize iconImageViewSize;
/// 按钮大小
@property (nonatomic, assign) CGSize reloadButtonSize;
/// 内容偏移量 默认 0
@property (nonatomic, assign) CGFloat contentViewOffSetY;
/// 背景触摸 默认 NO
@property (nonatomic, assign) BOOL allowBackgroundTouch;
/// 背景触摸回调
@property (nonatomic, copy) BackgroundTouchBlock backgroundTouchBlock;


@end
