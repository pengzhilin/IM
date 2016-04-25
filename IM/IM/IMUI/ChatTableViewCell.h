//
//  ChatTableViewCell.h
//  IM
//
//  Created by pengzhilin on 16/4/25.
//  Copyright © 2016年 pengzhilin. All rights reserved.
//
//  聊天单元格
//
//

#import <UIKit/UIKit.h>
#import "ChatFrame.h"
#import "ChatBoxView.h"


@interface ChatTableViewCell : UITableViewCell


@property (nonnull,nonatomic,strong) ChatFrame  *chatFrame;


@end
