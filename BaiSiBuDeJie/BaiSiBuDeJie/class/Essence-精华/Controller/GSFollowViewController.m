//
//  GSFollowViewController.m
//  BaiSiBuDeJie
//
//  Created by most on 16/12/5.
//  Copyright © 2016年 most. All rights reserved.
//

#import "GSFollowViewController.h"

@interface GSFollowViewController ()

@end

@implementation GSFollowViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    UIButton  *btn =[[UIButton alloc] init];
    
    btn.frame =CGRectMake(100, 100, 100, 30);
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitle:@"点击登录" forState:UIControlStateNormal];
    
    [self.view addSubview:btn];
    
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)btnClick:(UIButton*)btn
{
    
    UIStoryboard  *storyBoard =[UIStoryboard storyboardWithName:@"LoginViewController" bundle:nil];
    
    UIViewController *loginController =[storyBoard instantiateViewControllerWithIdentifier:@"login"];
    
    [self presentViewController:loginController animated:YES completion:nil];
    
}



@end
