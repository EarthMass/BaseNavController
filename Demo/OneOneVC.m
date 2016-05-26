//
//  OneOneVC.m
//  BaseNavController
//
//  Created by Guohx on 16/5/26.
//  Copyright © 2016年 guohx. All rights reserved.
//

#import "OneOneVC.h"

@interface OneOneVC ()

@end

@implementation OneOneVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"OneOneVC";
    
//    self.navBarTranslucent = YES;
    
    //    self.navBarColor = [UIColor colorWithRed:1.000 green:1.000 blue:0.000 alpha:0.240];
    
    //    self.leftBtnV = ({
    //        UIView * cusView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    //        cusView.backgroundColor = [UIColor colorWithRed:1.000 green:0.000 blue:0.000 alpha:0.420];
    //        cusView;
    //    });
    
    self.titleViewCenter = NO;
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
