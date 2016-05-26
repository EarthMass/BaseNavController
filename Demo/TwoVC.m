//
//  TwoVC.m
//  TestProject
//
//  Created by Guohx on 16/5/20.
//
//

#import "TwoVC.h"
#import "UIButton+InBlock.h"

@interface TwoVC ()

@end

@implementation TwoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
     self.title = @"到twoV";
    self.rightStr = @"地位饿";
    self.hiddenStatusBar = YES;
    
    self.navBarColor = [UIColor colorWithRed:0.204 green:0.684 blue:0.970 alpha:1.000];
    
    self.titleV = ({
        UIView * cusView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 600, 40)];
        cusView.backgroundColor = [UIColor colorWithRed:1.000 green:0.000 blue:0.000 alpha:0.420];
        
        UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
        btn.backgroundColor = [UIColor yellowColor];
        [btn handleControlEvent:UIControlEventTouchUpInside withBlock:^{
            //
            NSLog(@"点击 自定义 rightBtnV");
            
        }];
        [cusView addSubview: btn];
        cusView;
    });

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
