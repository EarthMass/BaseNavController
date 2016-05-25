
//
//  GlobalMacro.h
//  TestProject
//
//  Created by Guohx on 16/5/25.
//
//

#ifndef GlobalMacro_h
#define GlobalMacro_h

/**
 *  全局宏定义
 */
#pragma mark-  字体

//不同设备的屏幕比例(当然倍数可以自己控制) plus 字体比 普通大 1.5倍
#define GFONT_SIZE_SCALE (([UIScreen mainScreen].bounds.size.height > 667) ? 1.5 : 1)
#define GFONT(fontSize) [UIFont systemFontOfSize:fontSize*GFONT_SIZE_SCALE]

#pragma mark-

#endif /* GlobalMacro_h */
