# BaseNavController
一个高度自定义的导航栏

https://github.com/EarthMass/BaseNavController/blob/master/demo.png
 [self cusRightBtnVWithImageArr:@[@"searchIcon.png",@"hisIcon.png"] clickBlock:^(NSInteger index) {
        NSLog(@"cusRightBtnVWithImageArr click is %ld",(long)index);
    }];


IOS7 +

特点
	基于UIViewController对导航栏配置的封装  【View controller-based status bar appearance YES】控制器优先级
	可自定义 导航栏 标题 左右 按钮
	快速 实现文字按钮
	可设置 隐藏状态栏 
	隐藏 左侧按钮
	手势返回支持  
	支持旋转
	plus字体可以 比例设置 ———等

使用：
	继承BaseNavViewController.h
   可以自己定制风格
   
   详细请参考demo
