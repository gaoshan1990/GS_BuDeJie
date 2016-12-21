//
//  GSTopicViewController.m
//  BaiSiBuDeJie
//
//  Created by most on 16/12/6.
//  Copyright © 2016年 most. All rights reserved.
//

#import "GSTopicViewController.h"
#import "GSRefreshNormalHeader.h"
#import "MJExtension.h"
#import "GSRefreshAutoFooter.h"
#import "GSAFHTTPSessionManager.h"
#import "GSTopicCell.h"
static NSString *const cellId =@"topicCell";

@interface GSTopicViewController ()
@property(nonatomic,strong)GSAFHTTPSessionManager *manager;
@property (nonatomic, copy) NSString *maxtime;
@property (nonatomic, strong) NSMutableArray<GSTopic *> *topics;

@end

@implementation GSTopicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTable];
    [self setupRefresh];//刷新
    


}
-(GSAFHTTPSessionManager *)manager{
    if (!_manager) {
        _manager =[[GSAFHTTPSessionManager alloc] init];
    }
    return _manager;
}
- (NSString *)aParam
{
//    if (self.parentViewController.class == [XMGNewViewController class]) {
//        return @"newlist";
//    }
    return @"list";
}

- (void)setupRefresh
{
    self.tableView.mj_header = [GSRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewTopics)];
    [self.tableView.mj_header beginRefreshing];
    
    self.tableView.mj_footer = [GSRefreshAutoFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreTopics)];

}
#pragma mark - 仅仅是为了消除编译器发出的警告 : type方法没有实现
- (GSTopicType)type {
    return 0;
}

-(void)loadNewTopics
{
    // 取消所有请求
    [self.manager.tasks makeObjectsPerformSelector:@selector(cancel)];
    
    // 参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = self.aParam;
    params[@"c"] = @"data";
    params[@"type"] = @(self.type);
    
    __weak typeof(self) weakSelf = self;
    
    // 发送请求
    [self.manager GET:GSCommonURL parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        // 存储maxtime(方便用来加载下一页数据)
        weakSelf.maxtime = responseObject[@"info"][@"maxtime"];
        
        // 字典数组 -> 模型数组
        weakSelf.topics = [GSTopic mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        
        // 刷新表格
        [weakSelf.tableView reloadData];
        
        // 让[刷新控件]结束刷新
        [weakSelf.tableView.mj_header endRefreshing];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        GSLog(@"请求失败 - %@", error);
        
        // 让[刷新控件]结束刷新
        [weakSelf.tableView.mj_header endRefreshing];
    }];
}
-(void)loadMoreTopics{
   
    // 取消所有的请求
    [self.manager.tasks makeObjectsPerformSelector:@selector(cancel)];
    
    // 参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = self.aParam;
    params[@"c"] = @"data";
    params[@"maxtime"] = self.maxtime;
    params[@"type"] = @(self.type);
    
    __weak typeof(self) weakSelf = self;
    
    // 发送请求
    [self.manager GET:GSCommonURL parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        // 存储这页对应的maxtime
        weakSelf.maxtime = responseObject[@"info"][@"maxtime"];
        
        // 字典数组 -> 模型数组
        NSArray<GSTopic *> *moreTopics = [GSTopic mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        [weakSelf.topics addObjectsFromArray:moreTopics];
        
        // 刷新表格
        [weakSelf.tableView reloadData];
        
        // 让[刷新控件]结束刷新
        [weakSelf.tableView.mj_footer endRefreshing];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        GSLog(@"请求失败 - %@", error);
        
        // 让[刷新控件]结束刷新
        [weakSelf.tableView.mj_footer endRefreshing];
    }];
    
}
- (void)setupTable
{
    self.tableView.backgroundColor = GSCommonBgColor;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.contentInset = UIEdgeInsetsMake(64 + 35, 0, 49, 0);
    self.tableView.scrollIndicatorInsets = self.tableView.contentInset;
    // 注册cell
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([GSTopicCell class]) bundle:nil] forCellReuseIdentifier:cellId];

}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.topics.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    GSTopicCell *cell =[tableView dequeueReusableCellWithIdentifier:cellId];
    
    cell.topic =self.topics[indexPath.row];
    
    return cell;
    
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
