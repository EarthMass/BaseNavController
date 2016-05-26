//
//  OneVC.m
//  TestProject
//
//  Created by Guohx on 16/5/20.
//
//

#import "OneVC.h"
#import "UIButton+InBlock.h"
#import "OneOneVC.h"

@interface OneVC ()

@end

@implementation OneVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"到oneV到到oneV到到oneV到";
    self.canGesBack = NO;
//    self.backStr = @"返回";
//    self.hiddenStatusBar = YES;
    self.hiddenStatusBarWhenRotate = YES;
    self.canRotate = YES;
    
    self.navBarTranslucent = YES;
    
//    self.navBarColor = [UIColor colorWithRed:1.000 green:1.000 blue:0.000 alpha:0.240];
    
//    self.leftBtnV = ({
//        UIView * cusView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
//        cusView.backgroundColor = [UIColor colorWithRed:1.000 green:0.000 blue:0.000 alpha:0.420];
//        cusView;
//    });
    
    self.titleViewCenter = NO;
    
    self.rightBtnV = ({
        UIView * cusView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 400, 40)];
        cusView.backgroundColor = [UIColor colorWithRed:1.000 green:0.000 blue:0.000 alpha:0.420];
        
        UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
        btn.backgroundColor = [UIColor yellowColor];
        [btn handleControlEvent:UIControlEventTouchUpInside withBlock:^{
            //
            NSLog(@"点击 自定义 rightBtnV");
            
        }];
        [cusView addSubview: btn];
        cusView;
    });
    
    [self cusRightBtnVWithImageArr:@[@"searchIcon.png",@"hisIcon.png"] clickBlock:^(NSInteger index) {
        NSLog(@"cusRightBtnVWithImageArr click is %ld",(long)index);
    }];
    
    self.titleV = ({
        UIView * cusView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 40)];
        cusView.backgroundColor = [UIColor colorWithRed:1.000 green:0.000 blue:0.000 alpha:0.420];
        cusView;
    });
 
    
    UIButton * btn1 = [[UIButton alloc] initWithFrame:CGRectMake(10, 64 - 10, 100, 40)];
    [btn1 setTitle:@"next" forState:UIControlStateNormal];
    btn1.backgroundColor = [UIColor brownColor];
    [btn1 addTarget:self action:@selector(btn1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    UIButton * btn2 = [[UIButton alloc] initWithFrame:CGRectMake(10, self.view.frame.size.height - 40, 100, 40)];
    [btn2 setTitle:@"第二个导航栏" forState:UIControlStateNormal];
    btn2.backgroundColor = [UIColor brownColor];
//    [btn2 addTarget:self action:@selector(btn2) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    
//    [self hiddenStatusBar:YES animation:YES];
}

- (void)btn1 {
    OneOneVC * oneoneVC = [[OneOneVC alloc] init];
    [self.navigationController pushViewController:oneoneVC animated:YES];
}

#ifdef __IPHONE_7_0
- (UIRectEdge)edgesForExtendedLayout {
    return UIRectEdgeTop;
}
#endif

- (void)backBtnClick {
//    [super backBtnClick];

//    NSNumber * value = [NSNumber numberWithInt:UIDeviceOrientationUnknown];
//    [[UIDevice currentDevice] setValue:value forKey:@"orientation"];
    
     NSNumber * value1 = [NSNumber numberWithInt:UIDeviceOrientationPortrait];
     [[UIDevice currentDevice] setValue:value1 forKey:@"orientation"];
    
     [self.navigationController popViewControllerAnimated:YES];
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
