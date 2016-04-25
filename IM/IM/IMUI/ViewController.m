//
//  ChatViewController.m
//  IM
//
//  Created by pengzhilin on 16/4/25.
//  Copyright © 2016年 pengzhilin. All rights reserved.
//

#import "ViewController.h"
#import "ChatTableViewCell.h"
#import "ChatFrame.h"
#import "ChatModel.h"
#import "keyBoardToolBar.h"

@interface ViewController ()  <EMChatManagerDelegate,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate,keyBoardToolBarDeletage>

@property (nonnull,nonatomic,strong) UITableView *tableView;

@property (nonnull,nonatomic,strong) keyBoardToolBar *keyboardTextFiledToolBar;
@property (nonnull,nonatomic,strong) NSMutableArray *allArray;

@end

@implementation ViewController


#pragma mark  LifeStyle Method
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"聊天"];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.keyboardTextFiledToolBar];
    
    //设置代理
    [[EMClient sharedClient].chatManager addDelegate:self delegateQueue:nil];
    
    
    
    
    //添加几条模拟数据
    ChatFrame *charFrame = [[ChatFrame alloc]init];
    ChatModel *chatModel = [[ChatModel alloc]init];
    [chatModel setText:@"周末我们去看电影吧!"];
    [chatModel setMessageType:oneSelf];
    [charFrame setChatModel:chatModel];
    [self.allArray addObject:charFrame];
    
    ChatFrame *charFrame1 = [[ChatFrame alloc]init];
    ChatModel *chatModel1 = [[ChatModel alloc]init];
    [chatModel1 setText:@"好的"];
    [chatModel1 setMessageType:other];
    [charFrame1 setChatModel:chatModel1];
    [self.allArray addObject:charFrame1];
    
    ChatFrame *charFrame2 = [[ChatFrame alloc]init];
    ChatModel *chatModel2 = [[ChatModel alloc]init];
    [chatModel2 setText:@"我们去哪看电影哪？"];
    [chatModel2 setMessageType:other];
    [charFrame2 setChatModel:chatModel2];
    [self.allArray addObject:charFrame2];
    
    ChatFrame *charFrame3 = [[ChatFrame alloc]init];
    ChatModel *chatModel3 = [[ChatModel alloc]init];
    [chatModel3 setText:@"1 2 3 4 5 6 7 8 9 10 11 21 31 14 15 16 17 18 19 20 21 22"];//
    [chatModel3 setMessageType:oneSelf];
    [charFrame3 setChatModel:chatModel3];
    [self.allArray addObject:charFrame3];
    
    ChatFrame *charFrame4 = [[ChatFrame alloc]init];
    ChatModel *chatModel4 = [[ChatModel alloc]init];
    [chatModel4 setText:@"干啥哪？"];
    [chatModel4 setMessageType:other];
    [charFrame4 setChatModel:chatModel4];
    [self.allArray addObject:charFrame4];
    
    
    ChatFrame *charFrame5 = [[ChatFrame alloc]init];
    ChatModel *chatModel5 = [[ChatModel alloc]init];
    [chatModel5 setText:@"我在数数"]; //我们在大上海商厦门口见面"
    [chatModel5 setMessageType:oneSelf];
    [charFrame5 setChatModel:chatModel5];
    [self.allArray addObject:charFrame5];
    
    
    ChatFrame *charFrame6 = [[ChatFrame alloc]init];
    ChatModel *chatModel6 = [[ChatModel alloc]init];
    [chatModel6 setText:@"我也不知道咱们去大上海怎么样那里交通方便有商场和小吃城我们看完电影还可以去逛商城逛累了还可以到小吃城吃饭"];
    [chatModel6 setMessageType:oneSelf];
    [charFrame6 setChatModel:chatModel6];
    [self.allArray addObject:charFrame6];
    
    
    ChatFrame *charFrame7 = [[ChatFrame alloc]init];
    ChatModel *chatModel7 = [[ChatModel alloc]init];
    [chatModel7 setText:@"好的，我们就去那边"];
    [chatModel7 setMessageType:oneSelf];
    [charFrame7 setChatModel:chatModel7];
    [self.allArray addObject:charFrame7];
    
    
   
    
    
//    [self registerWithUsername:@"yaozhijie" withPassword:@"123456"];
    [self loginWithUsername:@"8002" withPassword:@"111111"];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self aadNotification];
}


-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}




-(void)aadNotification
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWilShow:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWilHide:) name:UIKeyboardWillHideNotification object:nil];
}


#pragma mark  Getter/Setter Method

-(NSMutableArray *)allArray
{
    if (_allArray == nil)
    {
        _allArray = [NSMutableArray array];
    }
    return _allArray;
}


#pragma mark 键盘工具条
-(keyBoardToolBar *)keyboardTextFiledToolBar
{
    if (_keyboardTextFiledToolBar == nil)
    {
        _keyboardTextFiledToolBar = [[keyBoardToolBar alloc]initWithFrame:CGRectMake(0, kScreen_Height-40, kScreen_Width, 40) withDeletage:self];
    }
    return _keyboardTextFiledToolBar;
}
-(UITableView *)tableView
{
    if (_tableView == nil)
    {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Height-40) style:UITableViewStylePlain];
        [_tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        [_tableView setDelegate:self];
        [_tableView setDataSource:self];
    }
    return _tableView;
}


#pragma mark 注册
-(void)registerWithUsername:(NSString*)username withPassword:(NSString*)password
{

    EMError *error = [[EMClient sharedClient] registerWithUsername:username password:password];
    if (error==nil)
    {
        NSLog(@"注册成功");
    }
    else
    {
        
    }
}


#pragma mark 登录
-(void)loginWithUsername:(NSString*)username withPassword:(NSString*)password
{
    EMError *error = [[EMClient sharedClient] loginWithUsername:username password:password];
    if (!error)
    {
        
        NSLog(@"登陆成功");
    }
}





#pragma mark  EMChatManagerDelegate
// 收到消息的回调，带有附件类型的消息可以用SDK提供的下载附件方法下载（后面会讲到）

- (void)didReceiveMessages:(NSArray *)aMessages
{
    for (EMMessage *message in aMessages)
    {
        NSLog(@"message.from:%@==to%@",message.from,message.to);
        EMMessageBody *msgBody = message.body;
        switch (msgBody.type)
        {
            case EMMessageBodyTypeText:
            {
                // 收到的文字消息
                EMTextMessageBody *textBody = (EMTextMessageBody *)msgBody;
                NSString *txt = textBody.text;
                NSLog(@"收到的文字是 txt -- %@",txt);
                
                ChatFrame *frame = [[ChatFrame alloc]init];
                ChatModel *model = [[ChatModel alloc]init];
                [model setText:txt];
                [model setMessageType:other];
                [frame setChatModel:model];
                [self.allArray addObject:frame];
                [self insertWithAllArray:self.allArray];
                
            }
                break;
            case EMMessageBodyTypeImage:
            {
                // 得到一个图片消息body
                EMImageMessageBody *body = ((EMImageMessageBody *)msgBody);
                NSLog(@"大图remote路径 -- %@"   ,body.remotePath);
                NSLog(@"大图local路径 -- %@"    ,body.localPath); // // 需要使用sdk提供的下载方法后才会存在
                NSLog(@"大图的secret -- %@"    ,body.secretKey);
                NSLog(@"大图的W -- %f ,大图的H -- %f",body.size.width,body.size.height);
                NSLog(@"大图的下载状态 -- %lu",body.downloadStatus);
                
                
                // 缩略图sdk会自动下载
                NSLog(@"小图remote路径 -- %@"   ,body.thumbnailRemotePath);
                NSLog(@"小图local路径 -- %@"    ,body.thumbnailLocalPath);
                NSLog(@"小图的secret -- %@"    ,body.thumbnailSecretKey);
                NSLog(@"小图的W -- %f ,大图的H -- %f",body.thumbnailSize.width,body.thumbnailSize.height);
                NSLog(@"小图的下载状态 -- %lu",body.thumbnailDownloadStatus);
            }
                break;
            case EMMessageBodyTypeLocation:
            {
                EMLocationMessageBody *body = (EMLocationMessageBody *)msgBody;
                NSLog(@"纬度-- %f",body.latitude);
                NSLog(@"经度-- %f",body.longitude);
                NSLog(@"地址-- %@",body.address);
            }
                break;
            case EMMessageBodyTypeVoice:
            {
                // 音频sdk会自动下载
                EMVoiceMessageBody *body = (EMVoiceMessageBody *)msgBody;
                NSLog(@"音频remote路径 -- %@"      ,body.remotePath);
                NSLog(@"音频local路径 -- %@"       ,body.localPath); // 需要使用sdk提供的下载方法后才会存在（音频会自动调用）
                NSLog(@"音频的secret -- %@"        ,body.secretKey);
                NSLog(@"音频文件大小 -- %lld"       ,body.fileLength);
                NSLog(@"音频文件的下载状态 -- %lu"   ,body.downloadStatus);
                NSLog(@"音频的时间长度 -- %lu"      ,body.duration);
            }
                break;
            case EMMessageBodyTypeVideo:
            {
                EMVideoMessageBody *body = (EMVideoMessageBody *)msgBody;
                
                NSLog(@"视频remote路径 -- %@"      ,body.remotePath);
                NSLog(@"视频local路径 -- %@"       ,body.localPath); // 需要使用sdk提供的下载方法后才会存在
                NSLog(@"视频的secret -- %@"        ,body.secretKey);
                NSLog(@"视频文件大小 -- %lld"       ,body.fileLength);
                NSLog(@"视频文件的下载状态 -- %lu"   ,body.downloadStatus);
                NSLog(@"视频的时间长度 -- %lu"      ,body.duration);
                NSLog(@"视频的W -- %f ,视频的H -- %f", body.thumbnailSize.width, body.thumbnailSize.height);
                
                // 缩略图sdk会自动下载
                NSLog(@"缩略图的remote路径 -- %@"     ,body.thumbnailRemotePath);
                NSLog(@"缩略图的local路径 -- %@"      ,body.thumbnailLocalPath);
                NSLog(@"缩略图的secret -- %@"        ,body.thumbnailSecretKey);
                NSLog(@"缩略图的下载状态 -- %lu"      ,body.thumbnailDownloadStatus);
            }
                break;
            case EMMessageBodyTypeFile:
            {
                EMFileMessageBody *body = (EMFileMessageBody *)msgBody;
                NSLog(@"文件remote路径 -- %@"      ,body.remotePath);
                NSLog(@"文件local路径 -- %@"       ,body.localPath); // 需要使用sdk提供的下载方法后才会存在
                NSLog(@"文件的secret -- %@"        ,body.secretKey);
                NSLog(@"文件文件大小 -- %lld"       ,body.fileLength);
                NSLog(@"文件文件的下载状态 -- %lu"   ,body.downloadStatus);
            }
                break;
                
            default:
                break;
        }
    }
}



#pragma mark  Delegate Method
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.allArray[indexPath.row] cellHight];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellindentifier = @"cellindentifier";
    
    ChatTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellindentifier];
    if (cell == nil)
    {
        cell = [[ChatTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellindentifier];
    }
    [cell setChatFrame:self.allArray[indexPath.row]];
//    [cell setBackgroundColor:[self randomColor]];
    return cell;
}

-(UIColor *) randomColor
{
    CGFloat hue = ( arc4random() % 256 / 256.0 ); //0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5; // 0.5 to 1.0,away from white
    
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5; //0.5 to 1.0,away from black
    
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.allArray count];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    [self scrollToBottom:self.allArray];
    return YES;
}

#pragma mark keyBoardToolBarDeletage 
#pragma mark  发送信息
-(void)sendMessageButtonAction:(UIButton*)sender
{
    if (![self.keyboardTextFiledToolBar.inputTextField.text isEqualToString:@""])
    {
        EMTextMessageBody *body = [[EMTextMessageBody alloc] initWithText:self.keyboardTextFiledToolBar.inputTextField.text];
        NSString *from = [[EMClient sharedClient] currentUsername];
        
        NSDictionary *messageExt = @{@"key":@"value"};
        //生成Message
        EMMessage *message = [[EMMessage alloc] initWithConversationID:@"8002" from:from to:@"8002" body:body ext:messageExt];
        message.chatType = EMChatTypeChat;// 设置为单聊消息
        
        [[EMClient sharedClient].chatManager asyncSendMessage:message progress:^(int progress) {
            
            
            NSLog(@"消息发送进度：%d",progress);
            
        } completion:^(EMMessage *message, EMError *error)
        {
            if (!error)
            {
                ChatFrame *frame = [[ChatFrame alloc]init];
                ChatModel *model = [[ChatModel alloc]init];
                [model setText:self.keyboardTextFiledToolBar.inputTextField.text];
                [model setMessageType:oneSelf];
                [frame setChatModel:model];
                [self.allArray addObject:frame];
                
                NSIndexPath *indexPath = [NSIndexPath indexPathForRow:[self.allArray count]-1 inSection:0];
                //向表视图中动态插入一条数据
                [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
                //表视图滚动到当前行
                [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];
                //把文本框置为空
                [self.keyboardTextFiledToolBar.inputTextField setText:nil];
            }
        }];
    }
}


#pragma mark  Private Method
#pragma mark 通知方法
-(void)keyboardWilShow:(NSNotification *)notification
{
    /**
     获取键盘升起时的动画时间
     */
    float AnimationDuration = [[notification.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    /**
     获取键盘的位置
     */
    CGRect keyBoardRect = [[notification.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    
    CGFloat keyBoard_Y = keyBoardRect.origin.y;
    
    
    [UIView animateWithDuration:AnimationDuration animations:^{
        
        [self.keyboardTextFiledToolBar setFrame:CGRectMake(0, keyBoard_Y - 40, kScreen_Width, 40)];
        
        [self.tableView setFrame:CGRectMake(0,  0,kScreen_Width, kScreen_Height-(kScreen_Height-keyBoard_Y+40))];
    
        
        [self scrollToBottom:self.allArray];
        
    }];
    
    
    
  
}

-(void)keyboardWilHide:(NSNotification *)notification
{
    [UIView animateWithDuration:0.1 animations:^{
        
        [self.keyboardTextFiledToolBar setFrame:CGRectMake(0, kScreen_Height-40, kScreen_Width, 40)];
        
        [self.tableView setFrame:CGRectMake(0,  0,kScreen_Width, kScreen_Height-40)];
        
        
    }];
}

#pragma mark 滚动的底部
-(void)scrollToBottom:(NSMutableArray*)array
{
    if ([array count])
    {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:[array count]-1 inSection:0];
        [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionNone animated:YES];
    }
}



#pragma mark - 向表视图中添加聊天数据
-(void)insertWithAllArray:(NSMutableArray *)array
{
    if ([array count])
    {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:[array count]-1 inSection:0];
        [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
        [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionNone animated:YES];
    }
    
    
}


@end
