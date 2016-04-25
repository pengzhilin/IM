//
//  ChatModel.h
//  IM
//
//  Created by pengzhilin on 16/4/25.
//  Copyright © 2016年 pengzhilin. All rights reserved.
//





#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger,MessaheType)
{
    /**
     自己发送的信息类型
     */
    oneSelf = 1,
    
    /**
     别人发送的消息类型
     */
    other = 2,
};



@interface ChatModel : NSObject


/**
 聊天内容
 */
@property (nonatomic,copy) NSString *text;

@property (nonatomic) MessaheType messageType;

/**
 显示气泡的图片
 */
@property (nonatomic,strong) UIImage *image;




@end
