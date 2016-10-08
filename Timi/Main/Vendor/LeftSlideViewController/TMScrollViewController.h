//
//  TMScrollViewController.h
//  Timi
//
//  Created by JohnnyCheng on 2016/10/7.
//  Copyright © 2016年 LaiYoung. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kScreenWidth          [[UIScreen mainScreen] bounds].size.width
#define kScreenHeight         [[UIScreen mainScreen] bounds].size.height

@interface TMScrollViewController : UIViewController
@property (strong, nonatomic)  UIScrollView *contentScrollView;

@end
