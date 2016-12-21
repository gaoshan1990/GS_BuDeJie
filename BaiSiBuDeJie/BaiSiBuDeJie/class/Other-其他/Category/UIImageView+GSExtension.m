//
//  UIImageView+GSExtension.m
//  BaiSiBuDeJie
//
//  Created by most on 16/12/21.
//  Copyright © 2016年 most. All rights reserved.
//

#import "UIImageView+GSExtension.h"
#import "UIImage+Circle.h"
#import "UIImageView+WebCache.h"
@implementation UIImageView (GSExtension)

- (void)setCircleHeader:(NSString *)url
{
    UIImage *placeholder =[UIImage circleImage:@"defaultUserIcon"];
    
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:placeholder completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (image == nil) return;
        
        self.image = [image circleImage];
    }];
    
}

@end
