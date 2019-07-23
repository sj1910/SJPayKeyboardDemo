//
//  KeyboardView.h
//  PayKeyboard
//
//  Created by sino on 17/2/16.
//  Copyright © 2017年 sino. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KeyboardView : UIView

@property (nonatomic,strong)NSMutableArray *pwd;

@property (nonatomic,copy)void(^getPassword)(NSString *password);

-(void)callKeyBoard:(NSString*)str andType:(NSString*)type;

-(void)closeKeyboard;

@end
