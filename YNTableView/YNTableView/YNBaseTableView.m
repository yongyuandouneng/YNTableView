//
//  YNBaseTableView.m
//  052_对UITableView_UICollectionView封装
//
//  Created by ZYN on 17/1/22.
//  Copyright © 2017年 Yongneng Zheng. All rights reserved.
//

#import "YNBaseTableView.h"
#import <UIScrollView+EmptyDataSet.h>

@interface YNBaseTableView () <UITableViewDataSource, UITableViewDelegate, DZNEmptyDataSetSource, DZNEmptyDataSetDelegate>

@end

@implementation YNBaseTableView


- (instancetype)init {
    
    return [self initWithFrame:CGRectZero];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initTableView];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    
    self = [super initWithFrame:frame style:style];
    if (self) {
        [self initTableView];
    }
    return self;
    
}

- (void)initTableView {
    
    self.delegate = self;
    self.dataSource = self;
    self.emptyDataSetDelegate = self;
    self.emptyDataSetSource = self;
    
    _emptyDataSetShouldAllowScroll = NO;
    _emptyDataSetShouldDisplay = YES;
    
    self.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.showsVerticalScrollIndicator = NO;
    
    /// 取消延迟滑动
    self.delaysContentTouches = NO;
    self.canCancelContentTouches = YES;
    
    UIView *wrapView = self.subviews.firstObject;
    if (wrapView && [NSStringFromClass(wrapView.class) hasSuffix:@"WrapperView"]) {
        for (UIGestureRecognizer *gesture in wrapView.gestureRecognizers) {
            if ([NSStringFromClass(gesture.class) containsString:@"DelayedTouchesBegan"] ) {
                gesture.enabled = NO;
                break;
            }
        }
    }
    
}

#pragma mark - UITableViewDelegate  UITableViewDataSource

//sections-tableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 0;
}

//cell-tableview
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return nil;
    
}

#pragma mark - DZNEmptyDataSetSource - DZNEmptyDataSetDelegate

- (BOOL)emptyDataSetShouldAllowScroll:(UIScrollView *)scrollView {
    
    return _emptyDataSetShouldAllowScroll;
}

- (BOOL)emptyDataSetShouldDisplay:(UIScrollView *)scrollView {
    
    return _emptyDataSetShouldDisplay;
}

- (UIView *)customViewForEmptyDataSet:(UIScrollView *)scrollView {

    
    return _emptyDataView;
}


#pragma mark - PublicMethod


#pragma mark - Private Method
- (BOOL)touchesShouldCancelInContentView:(UIView *)view {
    if ( [view isKindOfClass:[UIControl class]]) {
        return YES;
    }
    return [super touchesShouldCancelInContentView:view];
}


#pragma mark - Setter

- (void)setHeaderAndFooterRefreshBlock:(HeaderAndFooterRefreshBlock)headerAndFooterRefreshBlock {
    _headerAndFooterRefreshBlock = [headerAndFooterRefreshBlock copy];
    
    [self addHeaderAndFooterWithCompletion:_headerAndFooterRefreshBlock];
}

- (void)setHeaderRefreshBlock:(HeaderRefreshBlock)headerRefreshBlock {
    
    _headerRefreshBlock = [headerRefreshBlock copy];
    [self addHeaderWithCompletion:_headerRefreshBlock];
    
}

- (void)setFooterRefreshBlock:(FooterRefreshBlock)footerRefreshBlock {
    
    _footerRefreshBlock = [footerRefreshBlock copy];
    
    [self addFooterWithCompletion:_footerRefreshBlock];
    
}

- (void)setIsLoading:(BOOL)isLoading {
    
    _isLoading = isLoading;
    if (!_loadingDataView) return;
    
    if (isLoading) {
        if (self.superview) {
            [self.superview addSubview:_loadingDataView];
        } else {
            [self addSubview:_loadingDataView];
        }
    } else {
        [_loadingDataView removeFromSuperview];
    }
    
    
}

@end
