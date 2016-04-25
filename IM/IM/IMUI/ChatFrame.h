//
//  ChatFrame.h
//  IM
//
//  Created by pengzhilin on 16/4/25.
//  Copyright © 2016年 pengzhilin. All rights reserved.
//










#import <Foundation/Foundation.h>
#import "ChatModel.h"

@interface ChatFrame : NSObject

@property (nonatomic,strong) ChatModel *chatModel;

@property (nonatomic) CGFloat cellHight;
@property (nonatomic) CGRect chatBoxFrame;
@property (nonatomic) CGRect textLabelFrame;





@end
