//
//  GSTopicCell.m
//  BaiSiBuDeJie
//
//  Created by most on 16/12/21.
//  Copyright © 2016年 most. All rights reserved.
//

#import "GSTopicCell.h"
#import "GSTopic.h"
#import "UIImageView+WebCache.h"
#import "UIImage+Circle.h"
#import "UIImageView+GSExtension.h"
@interface GSTopicCell()
@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *createdAtLabel;
@property (weak, nonatomic) IBOutlet UILabel *text_label;
@property (weak, nonatomic) IBOutlet UIButton *dingButton;
@property (weak, nonatomic) IBOutlet UIButton *caiButton;
@property (weak, nonatomic) IBOutlet UIButton *repostButton;
@property (weak, nonatomic) IBOutlet UIButton *commentButton;
/** 最热评论-整体 */
@property (weak, nonatomic) IBOutlet UIView *topCmtView;
@property (weak, nonatomic) IBOutlet UILabel *topCmtContentLabel;


@end
@implementation GSTopicCell

#pragma mark - 初始化
- (void)awakeFromNib
{
    [super awakeFromNib];
    self.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mainCellBackground"]];
}

- (void)setTopic:(GSTopic *)topic
{
    _topic = topic;
    
    [self.profileImageView setCircleHeader:topic.profile_image];
    self.nameLabel.text = topic.name;
    self.createdAtLabel.text = topic.created_at; // 调用get方法[topic created_at];
    self.text_label.text = topic.text;
    
    [self setupButton:self.dingButton number:topic.ding placeholder:@"顶"];
    [self setupButton:self.caiButton number:topic.cai placeholder:@"踩"];
    [self setupButton:self.repostButton number:topic.repost placeholder:@"分享"];
    [self setupButton:self.commentButton number:topic.comment placeholder:@"评论"];
    
//    // 最热评论
//    if (topic.top_cmt) { // 有最热评论
//        self.topCmtView.hidden = NO;
//        
//        NSString *username = topic.top_cmt.user.username; // 用户名
//        NSString *content = topic.top_cmt.content; // 评论内容
//        if (topic.top_cmt.voiceuri.length) {
//            content = @"[语音评论]";
//        }
//        self.topCmtContentLabel.text = [NSString stringWithFormat:@"%@ : %@", username, content];
//    } else { // 没有最热评论
//        self.topCmtView.hidden = YES;
//    }
    
//    // 中间内容
//    if (topic.type == XMGTopicTypeVideo) { // 视频
//        self.videoView.hidden = NO;
//        self.videoView.frame = topic.contentF;
//        self.videoView.topic = topic;
//        
//        self.voiceView.hidden = YES;
//        self.pictureView.hidden = YES;
//    } else if (topic.type == XMGTopicTypeVoice) { // 音频
//        self.voiceView.hidden = NO;
//        self.voiceView.frame = topic.contentF;
//        self.voiceView.topic = topic;
//        
//        self.videoView.hidden = YES;
//        self.pictureView.hidden = YES;
//    } else if (topic.type == XMGTopicTypeWord) { // 段子
//        self.videoView.hidden = YES;
//        self.voiceView.hidden = YES;
//        self.pictureView.hidden = YES;
//    } else if (topic.type == XMGTopicTypePicture) { // 图片
//        self.pictureView.hidden = NO;
//        self.pictureView.frame = topic.contentF;
//        self.pictureView.topic = topic;
//        
//        self.videoView.hidden = YES;
//        self.voiceView.hidden = YES;
//    }
}

- (void)setupButton:(UIButton *)button number:(NSInteger)number placeholder:(NSString *)placeholder
{
    if (number >= 10000) {
        [button setTitle:[NSString stringWithFormat:@"%.1f万", number / 10000.0] forState:UIControlStateNormal];
    } else if (number > 0) {
        [button setTitle:[NSString stringWithFormat:@"%zd", number] forState:UIControlStateNormal];
    } else {
        [button setTitle:placeholder forState:UIControlStateNormal];
    }
}

// 重写cell的frame方法 减小cell的高度，效果如同添加了分割线
-(void)setFrame:(CGRect)frame{
    
    
    frame.size.height-=10;
    frame.origin.y+=10;
    [super setFrame:frame];
    
    
}
@end
