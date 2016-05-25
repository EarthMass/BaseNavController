//
//  BaseNavVCDemo.m
//  TestProject
//
//  Created by Guohx on 16/5/20.
//
//

#import "BaseNavVCDemo.h"
#import "OneVC.h"
#import "TwoVC.h"

@interface BaseNavVCDemo ()

@end

@implementation BaseNavVCDemo

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
     self.title = @"导航栏";
    self.rightStr = @"右阿牛你";
    self.hiddenLeftBtn = YES;
    self.backStr = @"1212";
    
    UIButton * btn1 = [[UIButton alloc] initWithFrame:CGRectMake(10, 64, 100, 40)];
    [btn1 setTitle:@"第一个导航栏" forState:UIControlStateNormal];
    btn1.backgroundColor = [UIColor brownColor];
    [btn1 addTarget:self action:@selector(btn1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    UIButton * btn2 = [[UIButton alloc] initWithFrame:CGRectMake(10, 64 + 40 + 20, 100, 40)];
    [btn2 setTitle:@"第二个导航栏" forState:UIControlStateNormal];
    btn2.backgroundColor = [UIColor brownColor];
    [btn2 addTarget:self action:@selector(btn2) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
}

- (void)btn1 {
    OneVC * oneVC = [[OneVC alloc] init];
    [self.navigationController pushViewController:oneVC animated:YES];
}

- (void)btn2 {
    TwoVC * twoVC = [[TwoVC alloc] init];
    [self.navigationController pushViewController:twoVC animated:YES];
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
