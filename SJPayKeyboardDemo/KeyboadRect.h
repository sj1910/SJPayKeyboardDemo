//
//  KeyboadRect.h
//  PayKeyboard
//
//  Created by sino on 17/2/16.
//  Copyright © 2017年 sino. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KeyboardView.h"

@protocol GetpasswordDelegate <NSObject>

-(void)backPassword:(NSMutableArray *)_array;

-(void)closeKeyboard;

@end

@interface KeyboadRect : UIView

@property (nonatomic,strong)NSMutableArray *pwdArray;

//@property (nonatomic,copy) NSMutableArray *(^callback)();

@property (nonatomic,weak)id<GetpasswordDelegate> getpasswordDelegate;


@end
