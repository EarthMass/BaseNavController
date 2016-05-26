//
//  BaseNavgationController.m
//  TestProject
//
//  Created by Guohx on 16/5/24.
//
//

#import "BaseNavgationController.h"

#import "BaseNavViewController.h"

@interface BaseNavgationController ()<UIGestureRecognizerDelegate>

@end

@implementation BaseNavgationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self customNavBtnGesture];
  
}

- (void)customNavBtnGesture {
    __weak typeof (self) weakSelf = self;
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.delegate = weakSelf;
    }
}

#pragma mark- 旋转
//当前视图是否 允许旋转 YES允许 NO不允许
- (BOOL)shouldAutorotate {
    return [self.visibleViewController shouldAutorotate];
}
//支持那些旋转方向（project设置的）
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return [self.visibleViewController supportedInterfaceOrientations];
}

#pragma mark- push - pop
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    [super pushViewController:viewController animated:animated];
    [self.viewControllers indexOfObject:self.visibleViewController];
}
- (UIViewController *)popViewControllerAnimated:(BOOL)animated {

    UIViewController * vc = [super popViewControllerAnimated:animated];

    if (self.viewControllers.count == 1) { //一层 返回就是rootV
        
        if ([self.topViewController isKindOfClass:[BaseNavViewController class]]) {
            typeof(BaseNavViewController) * beforeVC = (BaseNavViewController *)self.topViewController;
            [beforeVC refreshNavBgColor];
        }
    } else { //多层
        if ([[self.viewControllers objectAtIndex:self.viewControllers.count - 1] isKindOfClass:[BaseNavViewController class]]) {
            typeof(BaseNavViewController) * beforeVC = (BaseNavViewController *)[self.viewControllers objectAtIndex:self.viewControllers.count - 1] ;
            [beforeVC refreshNavBgColor];
        }
    }
    
    return vc;
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
