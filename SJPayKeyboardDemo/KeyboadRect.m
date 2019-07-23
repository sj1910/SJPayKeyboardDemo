//
//  KeyboadRect.m
//  PayKeyboard
//
//  Created by sino on 17/2/16.
//  Copyright © 2017年 sino. All rights reserved.
//

#import "KeyboadRect.h"

@interface KeyboadRect () {
    
    NSMutableArray *_buttonArray;
    CGFloat _buttonWidth;
    CGFloat _buttonHeight;
}

@end

@implementation KeyboadRect

-(instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
    
        self.backgroundColor = [UIColor whiteColor];
        _pwdArray = [[NSMutableArray alloc]init];
        _buttonWidth = frame.size.width/3;
        _buttonHeight = frame.size.height/4;
        [self createNumsButton];
    }
    return  self;
}


-(void)createNumsButton{

    _buttonArray = [NSMutableArray arrayWithArray:@[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"",@"0",@""]];
    
    for (int i = 0 , n = 0; i < 4; i++) {
    
        for (int j = 0 ; j < 3; j++ , n++) {
        
            UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(_buttonWidth * j, _buttonHeight * i, _buttonWidth, _buttonHeight)];
            button.tag = n;
            [button setTitle:_buttonArray[n] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor colorWithRed:56/255.f green:56/255.f blue:56/255.f alpha:1.0f] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
            [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
            button.layer.borderColor = [UIColor colorWithRed:220/255.f green:220/255.f blue:220/255.f alpha:0.8f].CGColor;
            button.layer.borderWidth = 0.5;
            button.titleLabel.font = [UIFont systemFontOfSize:25];
            
            if (button.tag == 9 || button.tag == 11) {
            
                button.backgroundColor = [UIColor colorWithRed:224/255.f green:230/255.f blue:236/255.f alpha:1.0f];
                
                if (button.tag == 11) {
                
                    [button setImage:[[UIImage imageNamed:@"删除"] imageWithRenderingMode:1] forState:(UIControlStateNormal)];
                }
            }
            [self addSubview:button];
        }
        
    }
    
}


-(void)buttonClick:(UIButton*)sender{
    
    if ((sender.tag >= 0 && sender.tag <= 8) || sender.tag == 10) {
        
        if (_pwdArray.count < 6) {
            
            [_pwdArray addObject:sender.titleLabel.text];
        }
    }else if (sender.tag == 11) {
        
        [_pwdArray removeLastObject];
    }
    [self.getpasswordDelegate backPassword:_pwdArray];
}

@end
