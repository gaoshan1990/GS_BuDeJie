//
//  GSTopic.h
//  BaiSiBuDeJie
//
//  Created by most on 16/12/19.
//  Copyright © 2016年 most. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSUInteger, GSTopicType) {
    /** 全部 */
   GSTopicTypeAll = 1,
    /** 图片 */
   GSTopicTypePicture = 10,
    /** 段子 */
   GSTopicTypeWord = 29,
    /** 声音 */
   GSTopicTypeVoice = 31,
    /** 视频 */
   GSTopicTypeVideo = 41
};

@interface GSTopic : NSObject
/** id */
@property (nonatomic, copy) NSString *ID;
/** 用户的名字 */
@property (nonatomic, copy) NSString *name;
/** 用户的头像 */
@property (nonatomic, copy) NSString *profile_image;
/** 帖子的文字内容 */
@property (nonatomic, copy) NSString *text;
/** 帖子审核通过的时间 */
@property (nonatomic, copy) NSString *created_at;
/** 顶数量 */
@property (nonatomic, assign) NSInteger ding;
/** 踩数量 */
@property (nonatomic, assign) NSInteger cai;
/** 转发\分享数量 */
@property (nonatomic, assign) NSInteger repost;
/** 评论数量 */
@property (nonatomic, assign) NSInteger comment;
/** 最热评论 */
//@property (nonatomic, strong) XMGComment *top_cmt;
/** 帖子类型 */
@property (nonatomic, assign) GSTopicType type;
/** 图片的真实宽度 */
@property (nonatomic, assign) CGFloat width;
/** 图片的真实高度 */
@property (nonatomic, assign) CGFloat height;

/** 小图 */
@property (nonatomic, copy) NSString *small_image;
/** 中图 */
@property (nonatomic, copy) NSString *middle_image;
/** 大图 */
@property (nonatomic, copy) NSString *large_image;
/** 是否为gif动画图片 */
@property (nonatomic, assign) CGFloat cellHeight;

/** 音频时长 */
@property (nonatomic, assign) NSInteger voicetime;
/** 视频时长 */
@property (nonatomic, assign) NSInteger videotime;
/** 音频\视频的播放次数 */
@property (nonatomic, assign) NSInteger playcount;


/***** 额外增加的属性 - 方便开发 *****/
/** cell的高度 */
@property (nonatomic, assign) BOOL is_gif;
/** 中间内容的frame */
@property (nonatomic, assign) CGRect contentF;
/** 是否为超长图片 */
@property (nonatomic, assign, getter=isBigPicture) BOOL bigPicture;

@end
