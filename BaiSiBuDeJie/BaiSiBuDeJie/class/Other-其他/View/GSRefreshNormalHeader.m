//
//  GSRefreshNormalHeader.m
//  BaiSiBuDeJie
//
//  Created by most on 16/12/19.
//  Copyright © 2016年 most. All rights reserved.
//

#import "GSRefreshNormalHeader.h"

@implementation GSRefreshNormalHeader

-(void)prepare
{
    
    [super prepare];
    self.automaticallyChangeAlpha = YES;

    [self setTitle:@"正在刷新!!" forState:MJRefreshStatePulling];
    
}

@end
