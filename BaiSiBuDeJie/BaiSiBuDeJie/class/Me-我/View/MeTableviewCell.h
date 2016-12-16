//
//  MeTableviewCell.h
//  BaiSiBuDeJie
//
//  Created by most on 16/12/16.
//  Copyright © 2016年 most. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MeTableviewCell : UITableViewCell
/** 名字 */
@property (nonatomic, copy) NSString *name;
/** 图标 */
@property (nonatomic, copy) NSString *icon;
/** 路径 */
@property (nonatomic, copy) NSString *url;
@end
