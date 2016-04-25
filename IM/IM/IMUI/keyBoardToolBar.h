//
//  keyBoardToolBar.h
//  IM
//
//  Created by pengzhilin on 16/4/25.
//  Copyright © 2016年 pengzhilin. All rights reserved.
//
//
//  键盘工具条
//
//

#import <UIKit/UIKit.h>


@protocol keyBoardToolBarDeletage <NSObject>

-(void)sendMessageButtonAction:(UIButton*)sender;


@end


@interface keyBoardToolBar : UIView

/**
 输入文本框
 */
@property (nonatomic,strong) UITextField *inputTextField;


/**
 发送消息按钮
 */
@property (nonatomic,strong) UIButton *sendMessageButton;

@property (nonatomic) id <keyBoardToolBarDeletage> keyBoardDeletage;

-(instancetype)initWithFrame:(CGRect)frame withDeletage:(id)deletage;

@end
