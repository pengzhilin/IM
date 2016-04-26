# IM

集成环信demo,实现自己与自己对话，仅限发布文本信息，后期更新图片和视频、语音等功能
主要步骤：
1.集成环信SDK
2.注册app
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    //AppKey:注册的appKey，详细见下面注释。
    //apnsCertName:推送证书名(不需要加后缀)，详细见下面注释。
    EMOptions *options = [EMOptions optionsWithAppkey:@"diandian#anysay"];
    [options setApnsCertName:nil];
    [[EMClient sharedClient] initializeSDKWithOptions:options];
    
    
    return YES;
}
3.注册环信账号
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
4.登陆环信账号
#pragma mark 登录
-(void)loginWithUsername:(NSString*)username withPassword:(NSString*)password
{
    EMError *error = [[EMClient sharedClient] loginWithUsername:username password:password];
    if (!error)
    {
        
        NSLog(@"登陆成功");
    }
}
5.组装信息
 //生成Message
        EMMessage *message = [[EMMessage alloc] initWithConversationID:@"8002" from:from to:@"8002" body:body ext:messageExt];
6.发送信息
#pragma mark  发送信息
-(void)sendMessageButtonAction:(UIButton*)sender{......}
7.接收信息
8.解析信息
9.展示信息

收到信息后的回调 EMChatManagerDelegate
- (void)didReceiveMessages:(NSArray *)aMessages{......}

向表视图中添加聊天数据
-(void)insertWithAllArray:(NSMutableArray *)array{......}

