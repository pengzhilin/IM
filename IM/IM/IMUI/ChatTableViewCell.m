//
//  ChatTableViewCell.m
//  IM
//
//  Created by pengzhilin on 16/4/25.
//  Copyright © 2016年 pengzhilin. All rights reserved.
//

#import "ChatTableViewCell.h"

@interface ChatTableViewCell ()

@property (nonatomic,strong) ChatBoxView *chatBoxView;

@end


@implementation ChatTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifie
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifie];
    if (self)
    {
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        [self.contentView addSubview:self.chatBoxView];
        
    }
    return self;
}

-(void)setChatFrame:(ChatFrame *)frame
{
    [self.chatBoxView setFrame:frame.chatBoxFrame];
    [self.chatBoxView setImage:frame.chatModel.image];
    [self.chatBoxView.textLabel setFrame:frame.textLabelFrame];
    [self.chatBoxView.textLabel setText:frame.chatModel.text];
}



-(ChatBoxView*)chatBoxView
{
    if (_chatBoxView == nil)
    {

        _chatBoxView = [[ChatBoxView alloc]init];
    }
    return _chatBoxView;
}

@end
