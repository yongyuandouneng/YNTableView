//
//  DemoViewController1.m
//  YNTableView
//
//  Created by ZYN on 17/1/23.
//  Copyright © 2017年 Yongneng Zheng. All rights reserved.
//

#import "DemoViewController1.h"
#import "DemoTableView1.h"

@interface DemoViewController1 ()

@property (nonatomic, strong) DemoTableView1 *tableView;

@property (nonatomic, strong) NSMutableArray *arrayM;

@end

@implementation DemoViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
 
    
    _tableView = [[DemoTableView1 alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    
    /// 添加上拉刷新和加载更多回调
    __weak typeof(self) weakSelf = self;
    _tableView.headerAndFooterRefreshBlock = ^(BOOL isHeader) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            /// end
            [weakSelf.tableView endRefreshingWithIsHeader:isHeader];
        });
    };
    
    
    DemoNotDataView1 *nodataView1 = (DemoNotDataView1 *)(_tableView.emptyDataView);
    ///背景点击事件
    nodataView1.backgroundTouchBlock = ^{
        NSLog(@"点击了无数据页面背景~");
    };
    ///点击重新加载
    nodataView1.reloadButtonBlock = ^{
        NSLog(@"点击重新加载按钮~");
        self.tableView.isLoading = YES;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            self.tableView.isLoading = NO;
            /// 有数据
            _arrayM = @[@"测试", @"测试", @"测试", @"测试"].mutableCopy;
    
            self.tableView.dataArrayM = _arrayM;
            [self.tableView reloadData];
        });
    };
    
    [self.view addSubview:_tableView];
    
    
    
    /// 默认请求
    self.tableView.isLoading = YES;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        self.tableView.isLoading = NO;
        /// 无数据
        _arrayM = @[].mutableCopy;
        self.tableView.dataArrayM = _arrayM;
        [self.tableView reloadData];
    });
    
    
}


@end
