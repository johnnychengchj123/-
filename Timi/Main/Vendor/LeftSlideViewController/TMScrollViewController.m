//
//  TMScrollViewController.m
//  Timi
//
//  Created by JohnnyCheng on 2016/10/7.
//  Copyright © 2016年 LaiYoung. All rights reserved.
//

#import "TMScrollViewController.h"
#import "TMPiewViewController.h"
#import "HomePageViewController.h"

@interface TMScrollViewController ()<UIScrollViewDelegate>

@end

@implementation TMScrollViewController

- (UIScrollView *)contentScrollView
{
    if (!_contentScrollView) {
        
        UIScrollView *scrollView = [[UIScrollView alloc] init];
        scrollView.showsHorizontalScrollIndicator = NO;
        scrollView.showsVerticalScrollIndicator = NO;
        scrollView.pagingEnabled = YES;
        scrollView.bounces = NO;
        scrollView.delegate = self;
        scrollView.frame =  CGRectMake(0, 0, kScreenWidth, kScreenHeight);

        self.contentScrollView = scrollView;
        // 设置内容滚动范围
        self.contentScrollView.contentSize = CGSizeMake(2 * kScreenWidth, 0);
        
        [self.view addSubview:scrollView];
    
    }
    return _contentScrollView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   

    
    
    [self setUpChildViewController];
    
    // 添加所有子控制器对应标题
//    [self setUpTitleLabel];
    
     self.automaticallyAdjustsScrollViewInsets = NO;// 不想要添加额外滚动区域
  
    
    
}





- (void)setUpChildViewController
{
    //    TMControlManagerViewController *controlManageVC = [[TMControlManagerViewController alloc] init];
    HomePageViewController *controlManageVC = [[HomePageViewController alloc] init];
    
    TMPiewViewController *pieVC =  [[TMPiewViewController alloc]init];

 
  
    [self addChildViewController:controlManageVC];
    
    [self addChildViewController:pieVC];
    
    [self showVc:0];
    [self showVc:1];

}

- (void)showVc:(NSInteger)index
{
    CGFloat offsetX = index * kScreenWidth;
    
    UIViewController *vc = self.childViewControllers[index];
    
    if (vc.isViewLoaded) return;
    
    vc.view.frame = CGRectMake(offsetX, 0, kScreenWidth, kScreenHeight);
    
    [self.contentScrollView addSubview:vc.view];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
