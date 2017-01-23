//
//  ViewController.m
//  YNTableView
//
//  Created by ZYN on 17/1/23.
//  Copyright © 2017年 Yongneng Zheng. All rights reserved.
//

#import "ViewController.h"
#import "DemoViewController1.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (IBAction)btnOnClick:(id)sender {
    
    DemoViewController1 *demoVC1 = [[DemoViewController1 alloc] init];
    [self.navigationController pushViewController:demoVC1 animated:YES];
    
}


@end
