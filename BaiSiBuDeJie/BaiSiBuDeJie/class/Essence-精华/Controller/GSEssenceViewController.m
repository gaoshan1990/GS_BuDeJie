//
//  GSEssenceViewController.m
//  BaiSiBuDeJie
//
//  Created by most on 16/12/5.
//  Copyright © 2016年 most. All rights reserved.
//

#import "GSEssenceViewController.h"
#import "UIBarButtonItem+ExTension.h"
#import "CustomButton.h"
#import "GSAllViewController.h"
#import "GSVideoViewController.h"
#import "GSVoiceViewController.h"
#import "GSPictureViewController.h"
#import "GSWordViewController.h"

@interface GSEssenceViewController ()<UIScrollViewDelegate>
@property(nonatomic,strong)UIButton *currentButton;
@property(nonatomic,strong) UIView *titlesView;
@property(nonatomic,strong)UIView *indicatorView;
@property(nonatomic,strong)UIScrollView *scrollview;
@end

@implementation GSEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupNavi];
    [self setupTitlesView];
    [self setupScrollView];
    [self setupChildControllers];
    [self addChildVcView];//添加view
}
-(void)setupNavi
{
    self.navigationItem.leftBarButtonItem =[UIBarButtonItem initWithImage:@"MainTagSubIcon" highImage:@"MainTagSubIconClick" target:self action:@selector(leftButtonClick)];
   
    self.view.backgroundColor = GSCommonBgColor;
    // 标题
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
}
-(void)leftButtonClick
{
    
}
-(void)setupTitlesView
{
    self.titlesView =[[UIView alloc] init];
    self.titlesView .backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.7];

    self.titlesView.frame = CGRectMake(0, 64, self.view.GS_width, 35);
    [self.view addSubview:self.titlesView];
    
    NSArray *titles = @[@"声音", @"全部", @"视频", @"图片", @"段子"];
 
    CGFloat  butttonW =self.titlesView.GS_width/titles.count;
    CGFloat  buttonH =self.titlesView.GS_height;
    
    for (int i=0; i<titles.count; i++) {
        
        CustomButton *btn = [CustomButton buttonWithType:UIButtonTypeCustom];
        
        btn.frame =CGRectMake(i*butttonW, 0, butttonW, buttonH);
        [btn setTitle:titles[i] forState:UIControlStateNormal];
        btn.tag=i;
        [btn addTarget:self action:@selector(titleBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.titlesView addSubview:btn];
    }
    
    CustomButton *firstBtn =self.titlesView.subviews.firstObject;
     //指示器
    firstBtn.selected =YES;
    self.currentButton =firstBtn;
    self.indicatorView =[[UIView alloc] init];
    self.indicatorView.GS_width =firstBtn.GS_width;
    self.indicatorView.GS_height=1;
    self.indicatorView.backgroundColor =[UIColor redColor];
    self.indicatorView.GS_y =self.titlesView.GS_height-1;
    self.indicatorView.GS_centerX =firstBtn.GS_centerX;
    [self.titlesView addSubview:self.indicatorView];
}
-(void)titleBtnClick:(CustomButton*)btn
{
    self.currentButton.selected =NO;
    self.currentButton =btn;
    btn.selected = YES;
    [UIView animateWithDuration:0.2 animations:^{
        
        self.indicatorView.GS_centerX = btn.GS_centerX;

    }];
    
    //使scrollview 滚动到相应的位置
    
    CGPoint offset = self.scrollview.contentOffset;
    offset.x = btn.tag * self.scrollview.GS_width;
    [self.scrollview setContentOffset:offset animated:YES];

}
-(void)setupScrollView
{
    self.automaticallyAdjustsScrollViewInsets =NO;
    self.scrollview =[[UIScrollView alloc] init];
    self.scrollview.frame =self.view.bounds;
    
    self.scrollview.contentSize =CGSizeMake(self.view.GS_width*5, 0);
    self.scrollview.pagingEnabled = YES;
    self.scrollview.showsHorizontalScrollIndicator = NO;
    self.scrollview.showsVerticalScrollIndicator = NO;
    self.scrollview.delegate = self;

    [self.view insertSubview:self.scrollview atIndex:0];
    
}
-(void)setupChildControllers
{
    GSVoiceViewController*voice = [[GSVoiceViewController alloc] init];
    [self addChildViewController:voice];
    
    GSAllViewController *all = [[GSAllViewController alloc] init];
    [self addChildViewController:all];
    
    GSVideoViewController *video = [[GSVideoViewController alloc] init];
    [self addChildViewController:video];
    
    GSPictureViewController *picture = [[GSPictureViewController alloc] init];
    [self addChildViewController:picture];
    
    GSWordViewController *word = [[GSWordViewController alloc] init];
    [self addChildViewController:word];


}

#pragma mark - 添加子控制器的view
- (void)addChildVcView
{
    // 子控制器的索引
    NSUInteger index = self.scrollview.contentOffset.x / self.scrollview.GS_width;
    
    // 取出子控制器
    UIViewController *childVc = self.childViewControllers[index];
    if ([childVc isViewLoaded]) return;
    
    childVc.view.frame = self.scrollview.bounds;
    [self.scrollview addSubview:childVc.view];
}
#pragma mark - <UIScrollViewDelegate>
/**
 * 在scrollView滚动动画结束时, 就会调用这个方法
 * 前提: 使用setContentOffset:animated:或者scrollRectVisible:animated:方法让scrollView产生滚动动画
 */
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    [self addChildVcView];
}

/**
 * 在scrollView滚动动画结束时, 就会调用这个方法
 * 前提: 人为拖拽scrollView产生的滚动动画
 */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    // 选中\点击对应的按钮
    NSUInteger index = scrollView.contentOffset.x / scrollView.GS_width;
    CustomButton *titleButton = self.titlesView.subviews[index];
    
    [self titleBtnClick:titleButton];
    
    // 添加子控制器的view
    [self addChildVcView];
    
    
}

@end
