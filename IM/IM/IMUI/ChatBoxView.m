//
//  ChatBoxView.m
//  IM
//
//  Created by pengzhilin on 16/4/25.
//  Copyright © 2016年 pengzhilin. All rights reserved.
//

#import "ChatBoxView.h"

@implementation ChatBoxView


-(instancetype)init
{
    self = [super init];
    if (self)
    {
        [self addSubview:self.textLabel];
        
//        [self showBackgroundColor];
        
    }
    return self;
}



-(void)showBackgroundColor
{
    [self setBackgroundColor:[UIColor yellowColor]];
    [_textLabel setBackgroundColor:[UIColor purpleColor]];
}


-(UILabel *)textLabel
{
    if (_textLabel == nil)
    {
        _textLabel = [[UILabel alloc]init];
        [_textLabel setNumberOfLines:0];
        [_textLabel setFont:[UIFont systemFontOfSize:14.0]];
        
    }
    return _textLabel;
}

@end
