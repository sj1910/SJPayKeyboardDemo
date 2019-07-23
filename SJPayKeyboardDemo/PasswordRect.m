//
//  PasswordRect.m
//  PayKeyboard
//
//  Created by sino on 17/2/16.
//  Copyright © 2017年 sino. All rights reserved.
//


#import "PasswordRect.h"
#import <math.h>


@implementation PasswordRect

-(instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        //密码分割竖线
        for (int i = 0; i<5; i++) {
            
            UIView *view = [[UIView alloc] init];
            view.backgroundColor = [UIColor grayColor];
            view.alpha = 0.25;
            view.frame = CGRectMake( 20 + (i + 1) * (MainWidth - 40)/6, self.center.x - (MainWidth)/2, 0.75,(MainWidth - 40)/6);
            [self addSubview:view];
            
        }
    }
    return  self;
}


-(void)drawRect:(CGRect)rect {
    /**
        rectWidth     密码框宽度
        rectHeight    密码框高度
        leftTopPointX X点坐标
     */
    CGFloat rectWidth = MainWidth - 40;
    CGFloat rectHeight = rectWidth/6;
    CGFloat leftTopPointX = self.center.x - rectWidth/2;
    //密码边框线
    CGMutablePathRef path = CGPathCreateMutable();
    CGRect pwdRect = CGRectMake(leftTopPointX, 0, rectWidth, rectHeight);
    CGPathAddRoundedRect(path, NULL, pwdRect, 6, 6);
    CGContextRef ref = UIGraphicsGetCurrentContext();
    CGContextAddPath(ref, path);
    [[UIColor grayColor]setStroke];
    CGContextSetLineWidth(ref, 0.25);
    CGContextDrawPath(ref, kCGPathStroke);
    
    //画密码点
    /*
     space 点与边框的间距
     dotsize 点尺寸
     point 点左上角坐标
     */
    CGFloat space = 50;

    if (MainWidth < 330) {
        
        space = 35;
    }else if (MainWidth == 375){
        
        space = 43;
    }
    CGSize dotSize = CGSizeMake(rectHeight - space, rectHeight - space);
    CGPoint point = CGPointMake(leftTopPointX + space/2, space/2);
    if (_pwdArr.count > 0) {
        
        for (int i = 0; i < _pwdArr.count; i++) {
            
            UIImage *dot = [UIImage imageNamed:@"black_Dot"];
            [dot drawInRect:CGRectMake(point.x+i*rectWidth/6, point.y, dotSize.width, dotSize.height)];
        }
    }
    
}


@end
