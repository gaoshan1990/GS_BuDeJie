//
//  GSMeViewController.m
//  BaiSiBuDeJie
//
//  Created by most on 16/12/5.
//  Copyright © 2016年 most. All rights reserved.
//

#import "GSMeViewController.h"
#import "MeTableviewCell.h"
#import "MeTableviewCell.h"
#import "GSFootView.h"
#import "GSSettingViewController.h"
@interface GSMeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *mainTableview;
@end

@implementation GSMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self setupNav];
    [self setupTableview];

}
-(void)setupTableview
{
    self.mainTableview =[[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.mainTableview.delegate =self;
    self.mainTableview.dataSource =self;
    [self.view addSubview:self.mainTableview];
    
    //设置每个分区的header 和foot的高度
    
    self.mainTableview.sectionHeaderHeight =10;
    self.mainTableview.sectionFooterHeight =0;
    
    //设置tableview的内边距 使得tableview向上移动
    self.mainTableview.contentInset = UIEdgeInsetsMake(-25, 0, 0, 0);
    
    
    //设置tableview的footview
    
    GSFootView *footview =[[GSFootView alloc] init];
    self.mainTableview.tableFooterView =footview;
    
}
- (void)setupNav
{
    // 标题
    self.navigationItem.title = @"我的";
    // 右边-设置
    UIBarButtonItem *settingItem = [UIBarButtonItem initWithImage:@"mine-setting-icon" highImage:@"mine-setting-icon-click" target:self action:@selector(settingClick)];
    // 右边-月亮
    UIBarButtonItem *moonItem = [UIBarButtonItem initWithImage:@"mine-moon-icon" highImage:@"mine-moon-icon-click" target:self action:@selector(moonClick)];
    
    self.navigationItem.rightBarButtonItems = @[settingItem, moonItem];
}

- (void)settingClick
{
    
    
    GSSettingViewController *setting = [[GSSettingViewController alloc] init];
    [self.navigationController pushViewController:setting animated:YES];
}

- (void)moonClick
{
    GSLogFunc
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MeTableviewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell =[[MeTableviewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text =[NSString stringWithFormat:@"%ld",indexPath.section];
    
    
    
    // 4.设置数据
    if (indexPath.section == 0) {
        cell.textLabel.text = @"登录/注册";
        cell.imageView.image = [UIImage imageNamed:@"publish-audio"];
    } else {
        cell.textLabel.text = @"离线下载";
        // 只要有其他cell设置过imageView.image, 其他不显示图片的cell都需要设置imageView.image = nil
        cell.imageView.image = nil;
    }
    

    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
@end
