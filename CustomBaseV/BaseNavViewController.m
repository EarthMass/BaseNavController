//
//  BaseNavViewController.m
//  TestProject
//
//  Created by Guohx on 16/5/20.
//
//

#import "BaseNavViewController.h"
#import "GlobalMacro.h"

//视图背景颜色
#define GBackGroundColor [UIColor colorWithRed:0.960 green:1.000 blue:0.984 alpha:1.000]

//导航栏 属性 标题颜色 标题字体
#define GNavTextColor [UIColor whiteColor]
static int fontSize = 18; ///<导航栏标题文字 字体大小
#define GNavTextFont (GFONT(fontSize))

//导航 按钮 字体、颜色
#define GNavBtnTitleFont (GFONT(fontSize - 2))
#define GNavBtnTitleColorNormal [UIColor whiteColor]
#define GNavBtnTitleColorSelect [UIColor colorWithWhite:0.806 alpha:1.000]

//导航栏 颜色
#define GNavBgColor [UIColor colorWithRed:0.213 green:0.551 blue:1.000 alpha:0.000]

//默认导航 返回 按钮图标 名称
#define GNavBackImageName @"nav_btn_back_def"

@interface BaseNavViewController () {
    UINavigationBar * navBar;
    BOOL isVcBaseApper; ///< 导航的设置优先级
}

@property (nonatomic, copy) GCusNavClickIndex cusNavClickIndex;
/**
 *  左右 按钮的宽度
 */
@property (nonatomic, assign) CGFloat cusRightBtnW;
@property (nonatomic, assign) CGFloat cusLeftBtnW;

@end

@implementation BaseNavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = GBackGroundColor;
    
    
    navBar = self.navigationController.navigationBar;
    
    //#pragma mark- 判断 导航的设置优先级 为 控制器 否则有些设置会无效
    BOOL isVCBasedStatusBarAppearance = [[[NSBundle mainBundle]objectForInfoDictionaryKey:@"UIViewControllerBasedStatusBarAppearance"] boolValue];
    //    NSAssert(isVCBasedStatusBarAppearance, @"*******BaseNavViewController已VC作为根视图 \n请在Info.plist中设置UIViewControllerBasedStatusBarAppearance 为YES---\n否则以AppDelegate中的设置为准*******");
    
    isVcBaseApper = (isVCBasedStatusBarAppearance)?YES:NO;
    //
    //#pragma mark-
    
    self.canGesBack = YES;
    self.canRotate = NO;
    self.titleViewCenter = YES;
    
    [self setNavInit];

}

/**
 *  初始化导航界面
 */
- (void)setNavInit {
    /** [UINavigationBar appearance];
     *  请注意＊使用appearance设置UI效果最好采用全局的设置，在所有界面初始化前开始设置，否则可能失效。
     */
    
    //导航栏 字体 字色 背景色
    [navBar
     setTitleTextAttributes:
     @{
       NSForegroundColorAttributeName:GNavTextColor,
       NSFontAttributeName:GNavTextFont,
       }];
    //导航背景颜色
    self.navBarColor = GNavBgColor;
    
    self.navBarTranslucent = NO;
    
    //状态栏设置
    self.hiddenStatusBar = NO;
    
    //状态栏 字体颜色 黑色/白色 默认白色
    self.statusBarTextIsWhite = YES;
    
    //导航按钮初始化
    [self navBtnInit];
    
}

- (void)navBtnInit {
    
    //导航左按钮
    UIButton * leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftBtn setImageEdgeInsets:UIEdgeInsetsMake(10, 10, 10, 10)];
    
    [leftBtn setImage:[UIImage imageNamed:GNavBackImageName] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(backBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    [leftBtn sizeToFit];
    
    self.cusLeftBtnW = leftBtn.bounds.size.width;
    
    UIBarButtonItem * leftButton = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem = leftButton;
    
}

#pragma mark- 刷新当前页面 导航条颜色
- (void)refreshNavBgColor {
    if (_navBarColor) {
        self.navBarColor = _navBarColor;
        self.navBarTranslucent = _navBarTranslucent;
        self.hiddenStatusBar = _hiddenStatusBar;
    }
}

#pragma mark- 隐藏状态栏 设置状态栏风格
- (void)setHiddenStatusBarWhenRotate:(BOOL)hiddenStatusBarWhenRotate {
    _hiddenStatusBarWhenRotate = hiddenStatusBarWhenRotate;
}

- (void)setHiddenStatusBar:(BOOL)hidden {
    
    //    if (!hidden) {
    //        return;
    //    }
    _hiddenStatusBar = hidden;
    
    if (!isVcBaseApper) {
        [[UIApplication sharedApplication] setStatusBarHidden:hidden];
    } else {
        if ([self respondsToSelector:@selector(setNeedsStatusBarAppearanceUpdate)]) {
            
            [self prefersStatusBarHidden];
            
            [self performSelector:@selector(setNeedsStatusBarAppearanceUpdate)];
            
        }
    }
    
   
}

- (BOOL)prefersStatusBarHidden
{
    return _hiddenStatusBar;
}
////设置状态栏 风格 VC 不管理，属于UINavigationController管理【不调用】
//- (UIStatusBarStyle)preferredStatusBarStyle {
//    return UIStatusBarStyleDefault;
//}


- (void)setStatusBarTextIsWhite:(BOOL)isWhite {
    if (!isVcBaseApper) {
#warning 无效 在这之前已经 初始化过了,应该在AppDelegate中设置才有效
        [[UINavigationBar appearance] setBarStyle:(isWhite)?UIBarStyleBlack:UIBarStyleDefault];
    } else {
        [navBar setBarStyle:(isWhite)?UIBarStyleBlack:UIBarStyleDefault];
    }
}
#pragma mark- 导航栏颜色 透明否
- (void)setNavBarColor:(UIColor *)navColor {
    
    if ([[[UIDevice currentDevice] systemVersion] doubleValue] <7.0) {
        
        [navBar setTintColor:navColor];
        
    }else
    {
        [navBar setBarTintColor:navColor];
    }
    _navBarColor = navColor;
}
- (void)setNavBarTranslucent:(BOOL)translucent {
    _navBarTranslucent = translucent;
    navBar.translucent = translucent;
    if (translucent) {

       [navBar setBackgroundImage:[UIImage imageNamed:@"clearImage"] forBarMetrics:UIBarMetricsDefault];
//        [navBar setShadowImage:[UIImage imageNamed:@"clearImage"]];

    }
    else {
        
         [navBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        
    }
    

}

#pragma mark- 属性设置
- (void)setHiddenLeftBtn:(BOOL)hiddenLeftBtn {
    //    leftBarButtonItem
    _hiddenLeftBtn = hiddenLeftBtn;
    self.navigationItem.leftBarButtonItem = nil;
}

//手势 返回 开关
- (void)setCanGesBack:(BOOL)canGesBack {
    _canGesBack = canGesBack;
    
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = self.canGesBack;
    }
}

- (void)setCanRotate:(BOOL)canRotate {
    _canRotate = canRotate;
}

- (void)setTitleViewCenter:(BOOL)titleViewCenter {
    
    _titleViewCenter = titleViewCenter;
    if (!_titleV) {
        return;
    }
    [self setTitleV:_titleV];
}

#pragma mark- 文字标题

- (void)setRightStr:(NSString *)rightStr {
    
    //导航左按钮
    UIButton * rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [rightBtn setImageEdgeInsets:UIEdgeInsetsMake(10, 0, 5, 15)];
    
    [rightBtn addTarget:self action:@selector(rightBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [rightBtn setTitle:rightStr forState:UIControlStateNormal];
    [rightBtn setTitleColor:GNavBtnTitleColorNormal forState:UIControlStateNormal];
    [rightBtn setTitleColor:GNavBtnTitleColorSelect forState:UIControlStateHighlighted];
    rightBtn.titleLabel.font = GNavBtnTitleFont;
    
    [rightBtn sizeToFit];
    
    self.cusRightBtnW = rightBtn.bounds.size.width;
    
    
    UIBarButtonItem * rightButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem = rightButtonItem;
    
}

- (void)setBackStr:(NSString *)backStr {
    
    if (self.hiddenLeftBtn) {
        return;
    }
    
    //导航左按钮
    UIButton * leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [leftBtn addTarget:self action:@selector(backBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [leftBtn setTitle:backStr forState:UIControlStateNormal];
    [leftBtn setTitleColor:GNavBtnTitleColorNormal forState:UIControlStateNormal];
    [leftBtn setTitleColor:GNavBtnTitleColorSelect forState:UIControlStateHighlighted];
    leftBtn.titleLabel.font = GNavBtnTitleFont;
    
    [leftBtn sizeToFit];
    
    self.cusLeftBtnW = leftBtn.bounds.size.width;
    
    UIBarButtonItem * leftButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem = leftButtonItem;
    
}
#pragma mark-

#pragma mark- 自定义视图
- (void)setLeftBtnV:(UIView *)leftBtnV {
    if (!leftBtnV) {
        return;
    }
    _leftBtnV = leftBtnV;
    self.cusLeftBtnW = _leftBtnV.bounds.size.width;
    
    UIBarButtonItem * leftButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtnV];
    self.navigationItem.leftBarButtonItem = leftButtonItem;
}

- (void)setRightBtnV:(UIView *)rightBtnV {
    if (!rightBtnV) {
        return;
    }
    _rightBtnV = rightBtnV;
    self.cusRightBtnW = _rightBtnV.bounds.size.width;
    
    UIBarButtonItem * rightButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtnV];
    self.navigationItem.rightBarButtonItem = rightButtonItem;
}

- (void)cusRightBtnVWithImageArr:(NSArray *)imageArr clickBlock:(GCusNavClickIndex)clickBlock {
    if (imageArr.count == 0 || imageArr.count > 2) {
        return;
    }
    
    if (!clickBlock) {
        return;
    }
    _cusNavClickIndex = clickBlock;
    
    UIView * cusView = [[UIView alloc] initWithFrame:CGRectZero];
    
    cusView.frame = CGRectMake(0, 0, (imageArr.count == 1)?40:80, 40);
    
    for (int i = 0; i < imageArr.count; i ++) {
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        btn.tag = 10086 + i;
        
        btn.frame = CGRectMake((i == 0)?0:40, 2, 40, 40);
        [btn setImage:[UIImage imageNamed:imageArr[i]] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(cusRightBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [btn setImageEdgeInsets:UIEdgeInsetsMake(10, 10, 10, 10)];
        
        //        [btn setTitleColor:GNavBtnTitleColorNormal forState:UIControlStateNormal];
        //        [btn setTitleColor:GNavBtnTitleColorSelect forState:UIControlStateHighlighted];
        //        btn.titleLabel.font = GNavBtnTitleFont;
        
        [cusView addSubview:btn];
        
    }
    
    self.cusRightBtnW = cusView.bounds.size.width;
    
    UIBarButtonItem * rightButtonItem = [[UIBarButtonItem alloc] initWithCustomView:cusView];
    self.navigationItem.rightBarButtonItem = rightButtonItem;
}

- (void)setTitleV:(UIView *)titleV {
    if (!titleV) {
        return;
    }
    
    _titleV = titleV;
    
    if (_titleViewCenter) {
        CGRect frame = [self getMaxTitleViewRect];
        titleV.frame = frame;
    }
    
    NSLog(@"------- %f %f %f %f",titleV.frame.origin.x,titleV.frame.origin.y,titleV.frame.size.width,titleV.frame.size.height);
    
    self.navigationItem.titleView = titleV;
}

#pragma mark titleView 最大宽度 才居中
/**
 *  titleView 最大宽度 才居中
 *
 *  @return rect
 */
- (CGRect)getMaxTitleViewRect {
    
    CGRect frame;
    
    CGFloat maxWidth = _cusLeftBtnW > _cusRightBtnW ? _cusLeftBtnW : _cusRightBtnW;
    
    maxWidth += 15;//leftview 左右都有间隙，左边是5像素，右边是8像素，加2个像素的阀值 5 ＋ 8 ＋ 2
    
    frame.size.width = [UIScreen mainScreen].bounds.size.width - maxWidth * 2;
    frame.size.height = 44;
    
    return frame;
}

#pragma mark-


#pragma mark- 按钮点击事件
/**
 *  按钮点击事件 返回 中间 右侧
 */
- (void)backBtnClick {
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)centerBtnClick {
    NSLog(@"标题视图点击");
}
- (void)rightBtnClick {
    NSLog(@"右侧点击");
}
- (void)cusRightBtnClick:(UIButton *)sender {
    if (_cusNavClickIndex) {
        _cusNavClickIndex(sender.tag - 10086);
    }
}

#ifdef __IPHONE_7_0
- (UIRectEdge)edgesForExtendedLayout {
    return UIRectEdgeNone;
}
#endif

#pragma mark- 旋转到横屏隐藏 状态栏 旋转相关
- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    NSLog(@"rotate TO %ld",(long)toInterfaceOrientation);
    if (toInterfaceOrientation == UIInterfaceOrientationPortrait) {
        
        if (!_hiddenStatusBarWhenRotate) {
            self.hiddenStatusBar = NO;
        }
        
    } else {
        
        self.hiddenStatusBar = YES;
        
        
        
    }
}

#pragma mark- 旋转相关 旋转控制 在所在的tabBar或Navigation控制器中控制
//当前视图是否 允许旋转 YES允许 NO不允许
- (BOOL)shouldAutorotate {
    return _canRotate;
}
//支持那些旋转方向（project设置的）
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    
    return (_canRotate)?UIInterfaceOrientationMaskAll:UIInterfaceOrientationMaskPortrait;
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
