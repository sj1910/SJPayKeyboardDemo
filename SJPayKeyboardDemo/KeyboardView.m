//
//  KeyboardView.m
//  PayKeyboard
//
//  Created by sino on 17/2/16.
//  Copyright © 2017年 sino. All rights reserved.
//

#import "KeyboardView.h"
#import "PasswordRect.h"
#import "KeyboadRect.h"



@interface KeyboardView ()<GetpasswordDelegate> {
    
    UIButton *_closeBtn;
    UILabel *_title;
    UILabel *_cost;
    UILabel *_type;
    UIView *_pwdInput;
    UIButton *_forgetPwdBtn;
    KeyboadRect *_keyboardRect;
    PasswordRect *_pwdRect;
    UIView *_spLine;
    NSString *_password;
}

@property (nonatomic,strong)UIView *keyboard;

@end

@implementation KeyboardView

-(instancetype)initWithFrame:(CGRect)frame {
    
   self = [super initWithFrame:frame];
    
    if (self) {
        
        [self addSubview:self.keyboard];
        [self.keyboard mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.offset(0);
            make.right.offset(0);
            make.top.offset(0);
            make.bottom.offset(0);
        }];
    }
    return self;
}


-(UIView * )keyboard {
    
    if (!_keyboard) {
        
        _keyboard = [[UIView alloc] init];
        _keyboard.backgroundColor = [UIColor whiteColor];
    }
    return _keyboard;
}


//构建Keyboard
-(void)callKeyBoard:(NSString*)str andType:(NSString*)type {
    
    [self clearPassword];
    [self constructKeyboardWithPay:str andType:type];

}


- (void)constructKeyboardWithPay:(NSString*)str andType:(NSString *)type {
    
#pragma mark 关闭按钮
    _closeBtn = [[UIButton alloc]initWithFrame:CGRectMake(MainWidth - 35, 5, 30, 30)];
    [_closeBtn setImage:[UIImage imageNamed:@"关闭"] forState:UIControlStateNormal];
    [_closeBtn addTarget:self action:@selector(closeKeyboard) forControlEvents:UIControlEventTouchUpInside];
    
#pragma mark 标题
    _title = [[UILabel alloc]init];
    _title.center = CGPointMake(self.center.x, 20);
    _title.bounds = CGRectMake(0, 0, 200, 30);
    [_title lableText:@"请输入申领密码" color:0x666666 font:16 textAlignment:1];
    
#pragma mark 申领类型
    _type = [[UILabel alloc]init];
    _type.font = Font(16);
    _type.textColor = RGBOF(0x2385E9);
    _type.center = CGPointMake(self.center.x, 55);
    _type.bounds = CGRectMake(0, 0, MainWidth, 20);
    _type.textAlignment = NSTextAlignmentCenter;
    _type.text = type;
    
#pragma mark 申领金额
    _cost = [[UILabel alloc]init];
    _cost.textColor = RGBOF(0x2385E9);
    _cost.font = Font(24);
    _cost.textAlignment = NSTextAlignmentCenter;
    _cost.center = CGPointMake(self.center.x, 80);
    _cost.bounds = CGRectMake(0, 0, MainWidth, 20);
    _cost.text = [NSString stringWithFormat:@"%@元",str];
    
#pragma mark 分割线
    _spLine = [[UIView alloc]initWithFrame:CGRectMake(0, 40, MainWidth, 1)];
    _spLine.backgroundColor = RGBAOF(0xDCDCDC, 0.5);
    
#pragma mark 密码框
    _pwdRect = [[PasswordRect alloc]initWithFrame:CGRectMake(0, 110 , MainWidth, 70)];
    
#pragma mark 键盘
    _keyboardRect = [[KeyboadRect alloc]initWithFrame:CGRectMake(0, MainHeight * 0.6 - MainHeight * 0.35 +20, MainWidth, MainHeight * 0.35 -20)];
    _keyboardRect.getpasswordDelegate = self;
    
#pragma  mark 其他
    [_keyboard addSubview:_closeBtn];
    [_keyboard addSubview:_title];
    [_keyboard addSubview:_spLine];
    [_keyboard addSubview:_pwdRect];
    [_keyboard addSubview:_keyboardRect];
    [_keyboard addSubview:_cost];
    [_keyboard addSubview:_type];
}


-(void)closeKeyboard {
    
    [self clearPassword];
    [UIView animateWithDuration:0.35 animations:^{
        
        self.frame = CGRectMake(0, MainHeight, MainWidth,MainHeight * 0.6 + 20);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}


-(void)clearPassword {
    
    [_keyboardRect.pwdArray removeAllObjects];
    [_keyboardRect.getpasswordDelegate backPassword:_keyboardRect.pwdArray];
}


#pragma makr 代理
-(void)backPassword:(NSMutableArray *)_array {
    
    _pwd = [NSMutableArray arrayWithArray:_array];
    _pwdRect.pwdArr = [NSMutableArray arrayWithArray:_array];
    [_pwdRect setNeedsDisplay];
    if (_pwd.count == 6) {
        
        _password = @"";
        for (int i = 0; i< _pwd.count; i++) {
            
            _password = [_password stringByAppendingString:_pwd[i]];
        }
        if (self.getPassword) {
            
            self.getPassword(_password);
            [self closeKeyboard];
        }
    }
}

@end
