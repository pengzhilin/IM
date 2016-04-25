//
//  keyBoardToolBar.m
//  IM
//
//  Created by pengzhilin on 16/4/25.
//  Copyright © 2016年 pengzhilin. All rights reserved.
//

#import "keyBoardToolBar.h"

@implementation keyBoardToolBar



-(instancetype)initWithFrame:(CGRect)frame withDeletage:(id)deletage
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setBackgroundColor:[UIColor orangeColor]];
        [self setKeyBoardDeletage:deletage];
        [self addSubview:self.inputTextField];
        [self.inputTextField setDelegate:deletage];
        [self addSubview:self.sendMessageButton];
    }
    return self;
}



-(UITextField *)inputTextField
{
    if (_inputTextField == nil)
    {
        _inputTextField = [[UITextField alloc]initWithFrame:CGRectMake(10, 5, kScreen_Width-100, 30)];
        [_inputTextField setFont:[UIFont systemFontOfSize:14.0]];
        [_inputTextField setPlaceholder:@"请输入信息"];
        [_inputTextField setBackgroundColor:[UIColor grayColor]];
    }
    return _inputTextField;
}



-(UIButton *)sendMessageButton
{
    if (_sendMessageButton == nil)
    {
        _sendMessageButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_sendMessageButton setTitle:@"发送" forState:UIControlStateNormal];
        [_sendMessageButton setFrame:CGRectMake(kScreen_Width-80, 5, 70, 30)];
        [_sendMessageButton addTarget:self action:@selector(sendMessageAction:) forControlEvents:UIControlEventTouchUpInside];
        [_sendMessageButton setBackgroundColor:[UIColor blueColor]];
    }
    return _sendMessageButton;
}



-(void)sendMessageAction:(UIButton*)sneder
{
    if ([self.keyBoardDeletage respondsToSelector:@selector(sendMessageButtonAction:)])
    {
        
        [self.keyBoardDeletage sendMessageButtonAction:sneder];
    }
}


@end
