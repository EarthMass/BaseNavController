//
//  BaseNavViewController.h
//  TestProject
//
//  Created by Guohx on 16/5/20.
//
//

#import <UIKit/UIKit.h>
#import "UINavigationItem+margin.h"

#pragma mark- 导航栏一般一个程序就是一个风格 一个视图链 的导航栏是使用同一个【修改风格会整个都变化(背景颜色)】

/**
 *  自定义右侧 按钮 点击事件
 *
 *  @param index 索引
 */
typedef void(^GCusNavClickIndex)(NSInteger index);
/**
 *  自定义导航栏
 */
@interface BaseNavViewController : UIViewController

/**
 *  自定义视图 右侧按钮 左侧按钮 标题
 */
@property (nonatomic, strong) UIView * leftBtnV;
@property (nonatomic, strong) UIView * rightBtnV;
@property (nonatomic, strong) UIView * titleV; ///<最后设置 先设置两边按钮[便于计算最大的宽度]

/**
 *  左右标题
 */
@property (nonatomic, copy) NSString * backStr;
@property (nonatomic, copy) NSString * rightStr;

@property (nonatomic, assign) BOOL hiddenStatusBar; ///<状态栏隐藏 默认显示NO
@property (nonatomic, assign) BOOL hiddenStatusBarWhenRotate; ///<hiddenStatusBar YES,且当前页面支持旋转的情况 需要设置hiddenStatusBarWhenRotate YES,否则不需要


@property (nonatomic, assign) BOOL hiddenLeftBtn; ///<隐藏返回按钮 默认显示
@property (nonatomic, assign) BOOL canGesBack; ///<是否可以 滑动 返回上一级 默认有效
@property (nonatomic, assign) BOOL canRotate; ///<是否支持旋转 默认NO
@property (nonatomic, assign) BOOL titleViewCenter; ///<标题栏 是否居中 默认 居中

#pragma mark- 全局的 改变一个影响全部的视图,直到重新设置
@property (nonatomic, assign) BOOL statusBarTextIsWhite; ///<状态栏字体颜色  默认白色
@property (nonatomic, assign) UIColor * navBarColor; ///<导航栏颜色
@property (nonatomic, assign) BOOL navBarTranslucent; ///<导航栏是否透明 【没什么用】

/**
 *  设置 自定义的 导航栏 右侧 图片按钮【两个/一个】
 *
 *  @param imageArr   图片数组【最多两个】 大小20*20
 *  @param clickBlock 点击事件
 */
- (void)cusRightBtnVWithImageArr:(NSArray *)imageArr clickBlock:(GCusNavClickIndex)clickBlock;

/**
 *  按钮点击事件 返回 中间 右侧
 */
- (void)backBtnClick;
- (void)centerBtnClick;
- (void)rightBtnClick;

@end
