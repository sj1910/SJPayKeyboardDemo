//
//  Header.h
//  SJPayKeyboardDemo
//
//  Created by sino on 2019/7/22.
//  Copyright © 2019年 sino. All rights reserved.
//

#ifndef Header_h
#define Header_h

#import "UILabel+Text.h"
#import <Masonry/Masonry.h>
// 字体
#define Font(size) [UIFont systemFontOfSize:size]

#define RGBOF(rgbValue)     [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 \
alpha:1.0]

#define RGBAOF(v, a)        [UIColor colorWithRed:((float)(((v) & 0xFF0000) >> 16))/255.0 \
green:((float)(((v) & 0x00FF00) >> 8))/255.0 \
blue:((float)(v & 0x0000FF))/255.0 \
alpha:a]


//当前屏幕长、宽
#define MainWidth [UIScreen mainScreen].bounds.size.width
#define MainHeight [UIScreen mainScreen].bounds.size.height


#endif /* Header_h */
