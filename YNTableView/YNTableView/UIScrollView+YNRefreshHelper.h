//
//  UIScrollView+YNRefreshHelper.h
//  YNTableView
//
//  Created by ZYN on 17/1/23.
//  Copyright © 2017年 Yongneng Zheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (YNRefreshHelper)

/// 添加下拉刷新
- (void)addHeaderWithCompletion:(void(^)(void))completed;
/// 添加底部刷新
- (void)addFooterWithCompletion:(void(^)(void))completed;
/// 添加下拉刷新和底部刷新
- (void)addHeaderAndFooterWithCompletion:(void(^)(BOOL isHeader))completed;
/// 根据条件结束刷新
- (void)endRefreshingWithDataCondition:(BOOL)hasData isHeader:(BOOL)isHeader;
/// 结束刷新
- (void)endRefreshingWithIsHeader:(BOOL)isHeader;

@end
