//
//  GSSettingViewController.m
//  BaiSiBuDeJie
//
//  Created by most on 16/12/16.
//  Copyright © 2016年 most. All rights reserved.
//

#import "GSSettingViewController.h"
#import "GSClearCell.h"
static NSString * const GSClearCacheCellId = @"GSClearCacheCell";
static NSString * const GSSettingCellId = @"GSSettingCell";

@interface GSSettingViewController ()

@end

@implementation GSSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[GSClearCell class] forCellReuseIdentifier:GSClearCacheCellId];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:GSSettingCellId];
   
  
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  
    if (indexPath.row ==0) {
        
        GSClearCell *cell =[tableView dequeueReusableCellWithIdentifier:GSClearCacheCellId];
        
//        cell.textLabel.text =[NSString stringWithFormat:@"%ld",indexPath.row];
        
        return cell;
    }else if(indexPath.row ==1)
    {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:GSSettingCellId];
        
        cell.textLabel.text= [NSString stringWithFormat:@"%ld",indexPath.row];
        
        return cell;
    }
    return nil;
    
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
