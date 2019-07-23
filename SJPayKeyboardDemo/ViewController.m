//
//  ViewController.m
//  SJPayKeyboardDemo
//
//  Created by sino on 2019/7/19.
//  Copyright © 2019年 sino. All rights reserved.
//

#import "ViewController.h"
#import "KeyboardView.h"
@interface ViewController ()<UITextFieldDelegate>
@property (nonatomic,strong) UITextField *priceTF;
@property (nonatomic,strong) UIButton *payBtn;
@property (nonatomic,strong) UILabel *password;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor darkGrayColor];
    
    _priceTF = [[UITextField alloc] initWithFrame:CGRectMake(16, 100, 200, 40)];
    _priceTF.placeholder = @"请输入支付价格";
    _priceTF.delegate = self;
    _priceTF.backgroundColor = [UIColor grayColor];
    _priceTF.keyboardType = UIKeyboardTypeDecimalPad;
    [self.view addSubview:_priceTF];
    
    
    _payBtn = [UIButton buttonWithType:(UIButtonTypeSystem)];
    _payBtn.frame = CGRectMake(225, 100, 80, 40);
    [_payBtn setBackgroundColor:[UIColor orangeColor]];
    [_payBtn addTarget:self action:@selector(payMoney) forControlEvents:(UIControlEventTouchUpInside)];
    [_payBtn setTitle:@"确认付款" forState:(UIControlStateNormal)];
    [self.view addSubview:_payBtn];
    
    _password = [[UILabel alloc] initWithFrame:CGRectMake(16, 160, 200, 40)];
    _password.textColor = [UIColor redColor];
    [self.view addSubview:_password];
    
    
}

- (void)payMoney {
    
    [_priceTF endEditing:YES];
    KeyboardView *keyboardView = [[KeyboardView alloc] init];
    [self.view addSubview:keyboardView];
    keyboardView.frame = CGRectMake(0,self.view.frame.size.height, self.view.frame.size.width,self.view.frame.size.height * 0.6 + 20);
    
    [UIView animateWithDuration:0.35f animations:^{
        
        keyboardView.frame  = CGRectMake(0, self.view.frame.size.height * 0.4, self.view.frame.size.width, self.view.frame.size.height * 0.6 + 20);
    } completion:^(BOOL finished) {
        
    }];
    
    [keyboardView callKeyBoard:_priceTF.text andType:@"酸菜鱼"];
    
    keyboardView.getPassword = ^(NSString *passwork){
        self.password.text = [NSString stringWithFormat:@"支付密码:%@",passwork];
    };
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    
    
    
}



@end
