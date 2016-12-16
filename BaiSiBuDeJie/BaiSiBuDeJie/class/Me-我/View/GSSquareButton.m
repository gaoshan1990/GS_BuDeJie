//
//  GSSquareButton.m
//  BaiSiBuDeJie
//
//  Created by most on 16/12/16.
//  Copyright © 2016年 most. All rights reserved.
//

#import "GSSquareButton.h"
#import "UIButton+WebCache.h"
@implementation GSSquareButton

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:15];
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self setBackgroundImage:[UIImage imageNamed:@"mainCellBackground"] forState:UIControlStateNormal];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.imageView.GS_y = self.GS_height * 0.15;
    self.imageView.GS_height = self.GS_height * 0.5;
    self.imageView.GS_width = self.imageView.GS_height;
    self.imageView.GS_centerX = self.GS_width * 0.5;
    
    self.titleLabel.GS_x = 0;
    self.titleLabel.GS_y = self.imageView.GS_y+self.imageView.GS_height;
    self.titleLabel.GS_width = self.GS_width;
    self.titleLabel.GS_height = self.GS_height - self.titleLabel.GS_y;
}

- (void)setSquare:(GSMeSquare *)square
{
    _square = square;
    
    [self setTitle:square.name forState:UIControlStateNormal];
    [self sd_setImageWithURL:[NSURL URLWithString:square.icon] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"setup-head-default"]];
}

@end
