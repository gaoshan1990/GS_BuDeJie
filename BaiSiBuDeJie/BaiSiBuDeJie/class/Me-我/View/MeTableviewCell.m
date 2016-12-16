//
//  MeTableviewCell.m
//  BaiSiBuDeJie
//
//  Created by most on 16/12/16.
//  Copyright © 2016年 most. All rights reserved.
//

#import "MeTableviewCell.h"

@implementation MeTableviewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        self.textLabel.textColor = [UIColor darkGrayColor];
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        //        self.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow"]];
        self.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mainCellBackground"]];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if (self.imageView.image == nil) return;
    
    // imageView
    self.imageView.GS_y = GSSmallMargin;
    self.imageView.GS_height = self.contentView.GS_height - 2 * GSSmallMargin;
    self.imageView.GS_width = self.imageView.GS_height;
    
    // label
    self.textLabel.GS_x = self.imageView.GS_width+self.imageView.GS_x + GSMargin;
}
@end
