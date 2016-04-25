//
//  ChatFrame.m
//  IM
//
//  Created by pengzhilin on 16/4/25.
//  Copyright © 2016年 pengzhilin. All rights reserved.
//

#import "ChatFrame.h"

@implementation ChatFrame


-(void)setChatModel:(ChatModel *)model
{
    _chatModel = model;
    
    CGSize textSize  = [self contentWidthAndHight:model.text];
    
    
    CGFloat chatBoxHight = textSize.height + 30;
    CGFloat chatBoxWidth = textSize.width + 20;
    
    
    /**
     单元格的高度 = 气泡的高度 + 上下间隔的间隔20
     */
    [self setCellHight:chatBoxHight + 20];
    
    switch (model.messageType)
    {
        case oneSelf:
        {
            
           
            
            
            [self setTextLabelFrame:CGRectMake(10, 20, textSize.width, textSize.height)];
            [self setChatBoxFrame:CGRectMake(kScreen_Width-(chatBoxWidth+20), 10, chatBoxWidth, chatBoxHight)];
            
            
           
           
        
            model.image = [UIImage imageNamed:@"oneSelfBleb.png"];
            model.image = [model.image stretchableImageWithLeftCapWidth:model.image.size.width*0.2 topCapHeight:model.image.size.height*0.5];
        }
            break;
        case other:
        {
            [self setTextLabelFrame:CGRectMake(10, 20, textSize.width, textSize.height)];
            [self setChatBoxFrame:CGRectMake(20, 10, chatBoxWidth,chatBoxHight)];
            
            model.image = [UIImage imageNamed:@"otherBleb.png"];
            model.image = [model.image stretchableImageWithLeftCapWidth:model.image.size.width*0.8 topCapHeight:model.image.size.height*0.5];
        }
            break;
    }
}








#pragma mark - 计算“原文””的文本高度
-(CGSize)contentWidthAndHight:(NSString*)content
{
    //=========得到content的内容高度===========
    NSDictionary *AttriButes = @{NSFontAttributeName:[UIFont systemFontOfSize:14.0]};
    CGSize ContentSize = [content boundingRectWithSize:CGSizeMake(kScreen_Width - 60, MAXFLOAT)
                                                       options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                                    attributes:AttriButes
                                                       context:nil].size;
    //译文本高度
    return ContentSize;
}




@end
