//
//  DemoTableView1.m
//  YNTableView
//
//  Created by ZYN on 17/1/23.
//  Copyright © 2017年 Yongneng Zheng. All rights reserved.
//

#import "DemoTableView1.h"

@implementation DemoTableView1


- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    
    self = [super initWithFrame:frame style:style];
    if (self) {
        
        /// 设置无数据页面可以滚动 有默认值
        self.emptyDataSetShouldAllowScroll = YES;
        /// 设置无数据可以显示 有默认值
        self.emptyDataSetShouldDisplay = YES;

        DemoNotDataView1 *notDataView = [[DemoNotDataView1 alloc] initWithFrame:self.bounds];
        /// 设置偏移量
        notDataView.contentViewOffSetY = -44;
        
        self.emptyDataView = notDataView;
        /// 加载View
        DemoLoadingView1 *loadingView = [[DemoLoadingView1 alloc] initWithFrame:self.bounds];
        loadingView.backgroundColor = [UIColor whiteColor];
        UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        
        [indicator startAnimating];
        indicator.center = loadingView.center;
        [loadingView addSubview:indicator];
        
        /// 只有主动设置 isLoading  才显示Loading状态View
        self.loadingDataView = loadingView;
        
    }
    return self;
}

#pragma mark - UITableViewDelegate  UITableViewDataSource

//header-height
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    
    return 0.0001;
    
}
//header-secion
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    return [UIView new];
}

//footer-hegiht
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.0001;
}

//footer-section
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    return [UIView new];
}


//sections-tableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}
//rows-section
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataArrayM.count;
}
//cell-height
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 44;
}

//cell-tableview
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier = @"identifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    cell.textLabel.text = self.dataArrayM[indexPath.row];
    
    return cell;
    
}
//select-tableview
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
}

@end
