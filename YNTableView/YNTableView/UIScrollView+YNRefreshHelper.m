//
//  UIScrollView+YNRefreshHelper.m
//  YNTableView
//
//  Created by ZYN on 17/1/23.
//  Copyright © 2017年 Yongneng Zheng. All rights reserved.
//

#import "UIScrollView+YNRefreshHelper.h"
#import <MJRefresh.h>
@implementation UIScrollView (YNRefreshHelper)


- (void)addHeaderAndFooterWithCompletion:(void(^)(BOOL isHeader))completed {
    
    [self addHeaderWithCompletion:^{
        
        if (completed) {
            completed(YES);
        }
        
    }];
    
    [self addFooterWithCompletion:^{
        if (completed) {
            completed(NO);
        }
    }];
    
}



- (void)addHeaderWithCompletion:(void(^)(void))completed {
    
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        if (completed) {
            completed();
        }
        
    }];
    
    self.mj_header = header;
    
}


- (void)addFooterWithCompletion:(void(^)(void))completed {
    
    MJRefreshBackStateFooter *foot = [MJRefreshBackStateFooter footerWithRefreshingBlock:^{
        
        if (completed) {
            completed();
        }
        
    }];
    [foot setTitle:@"  上拉加载更多..." forState:MJRefreshStateIdle];
    [foot setTitle:@"  正在加载中..." forState:MJRefreshStateRefreshing];
    [foot setTitle:@"  没有更多数据了..." forState:MJRefreshStateNoMoreData];
    [foot setTitle:@"  松开就能加载啦..." forState:MJRefreshStatePulling];
    self.mj_footer = foot;
    
}


- (void)endRefreshingWithDataCondition:(BOOL)hasData isHeader:(BOOL)isHeader{
    
    if (isHeader) {
        
        [self.mj_footer setState:hasData ? MJRefreshStateIdle : MJRefreshStateNoMoreData];
        
        [self.mj_header endRefreshing];
        
    } else {
        
        if (!hasData) {
            [self.mj_footer setState:MJRefreshStateNoMoreData];
        } else {
            [self.mj_footer endRefreshing];
        }
    }
}

- (void)endRefreshingWithIsHeader:(BOOL)isHeader {
    
    if (isHeader) {
        [self.mj_header endRefreshing];
    } else {
        [self.mj_footer endRefreshing];
    }
    
    
}


@end
