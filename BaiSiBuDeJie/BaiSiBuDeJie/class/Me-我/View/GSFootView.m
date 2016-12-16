//
//  GSFootView.m
//  BaiSiBuDeJie
//
//  Created by most on 16/12/16.
//  Copyright © 2016年 most. All rights reserved.
//

#import "GSFootView.h"
#import "GSSquareButton.h"
#import <AFNetworking/AFNetworking.h>
#import <MJExtension/MJExtension.h>
@implementation GSFootView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        // 参数
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        params[@"a"] = @"square";
        params[@"c"] = @"topic";
        
        // 请求
        [[ AFHTTPSessionManager manager] GET:GSCommonURL parameters:params success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull responseObject) {
            // 字典数组 -> 模型数组
            NSArray *squares = [GSMeSquare mj_objectArrayWithKeyValuesArray:responseObject[@"square_list"]];
            // 根据模型数据创建对应的控件
            [self createSquares:squares];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            GSLog(@"请求失败 - %@", error);
        }];
    }
    return self;
}

/**
 *  根据模型数据创建对应的控件
 */
- (void)createSquares:(NSArray *)squares
{
    // 方块个数
    NSUInteger count = squares.count;
    
    // 方块的尺寸
    NSUInteger maxColsCount = 4; // 一行的最大列数
    CGFloat buttonW = self.GS_width / maxColsCount;
    CGFloat buttonH = buttonW;
    
    // 创建所有的方块
    for (NSUInteger i = 0; i < count; i++) {
        // 创建按钮
        GSSquareButton *button = [GSSquareButton buttonWithType:UIButtonTypeCustom];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        
        // 设置frame
        button.GS_x = (i % maxColsCount) * buttonW;
        button.GS_y = (i / maxColsCount) * buttonH;
        button.GS_width = buttonW;
        button.GS_height = buttonH;
        
        // 设置数据
        button.square = squares[i];
    }
    
    // 设置footer的高度 == 最后一个按钮的bottom(最大Y值)
    self.GS_height = CGRectGetMaxY(self.subviews.lastObject.frame);
    
    // 设置tableView的contentSize
    UITableView *tableView = (UITableView *)self.superview;
    tableView.tableFooterView = self;
     [tableView reloadData]; // 重新刷新数据(会重新计算contentSize)
    
    
}

- (void)buttonClick:(GSSquareButton *)button
{
    GSLog(@"--------");
           UITabBarController *tabBarVc = (UITabBarController *)self.window.rootViewController;
        UINavigationController *nav = tabBarVc.selectedViewController;
        
      }


@end
