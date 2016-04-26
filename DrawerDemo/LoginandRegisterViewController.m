//
//  LoginandRegisterViewController.m
//  DrawerDemo
//
//  Created by 张帆 on 16/4/22.
//  Copyright © 2016年 LJY. All rights reserved.
//

#import "LoginandRegisterViewController.h"
#import "LitterLAppDelegate.h"
#import "MMDrawerController.h"
#import "UIViewController+MMDrawerController.h"
#import "LitterLCenterViewController.h"
#import "LitterLLeftViewController.h"
#import "LitterLRightViewController.h"
#import "LoginandRegisterViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>

@interface LoginandRegisterViewController ()

@property(nonatomic,strong) MMDrawerController * drawerController;
@property(nonatomic,strong) AVPlayer *player;
@property(nonatomic,strong) AVPlayerItem *playerItem;
@property(nonatomic,strong) AVPlayerViewController *playerViewController;
@property(nonatomic,strong) UIImageView *buttonBG;
@end

@implementation LoginandRegisterViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    //增加 logo
   
    
    [self setConformButton];
    [self setBG];
   // [self setRegisterButton];
   // [self setBGAndLogoAndTitle];
    //[self setLoginAndRegisterView];
    
    
   // [self.playerViewController.player play];
    //[self.player play];
    
    //毛玻璃效果使用
    //1,创建，并制定效果，比如 light 或者 dark
    /*
    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    //  毛玻璃view 视图
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    
    
    //添加到要有毛玻璃特效的控件中
    CGRect frame = self.view.bounds;
    frame.size.height -= frame.size.height*0.3;
    frame.origin.y += frame.size.height;
    effectView.frame = frame;
    [self.view addSubview:effectView];
    //设置模糊透明度
    effectView.alpha = .6f;
    */
    //[self.view bringSubviewToFront:self.loginButton];
   // [self.view bringSubviewToFront:self.registerButton];
    self.usernameTextField.borderStyle = UITextBorderStyleNone;
    self.pwdTextField.borderStyle = UITextBorderStyleNone;
    [self.usernameTextField setBackgroundColor:[UIColor clearColor]];
    [self.pwdTextField setBackgroundColor:[UIColor clearColor]];
    
        
}


-(void)setBG{
    
    UIImageView *bg = [[UIImageView alloc]init];
    bg.frame = self.view.bounds;
    bg.image = [UIImage imageNamed:@"loginBG"];
   
    [self.view.layer insertSublayer:bg.layer atIndex:0];

}

-(void)setLoginAndRegisterView{
    //setting frame
    CGRect loginAndRegisterViewFrame = self.view.bounds;
    loginAndRegisterViewFrame.origin.y = self.view.frame.size.height - 150;
    loginAndRegisterViewFrame.size.height = 150;
    
    UIColor *setLoginAndRegisterViewColor = [UIColor colorWithRed:28/255 green:37/255 blue:45/255 alpha:1];

    //setting setLoginAndRegisterView
    UIView *loginAndRegisterView = [[UIView alloc]initWithFrame:loginAndRegisterViewFrame];
    [loginAndRegisterView setBackgroundColor:setLoginAndRegisterViewColor];
    [self.view.layer insertSublayer:loginAndRegisterView.layer below:self.conformButton .layer];
}

- (void)setConformButton{
    
    UIImage *buttonImage = [UIImage imageNamed:@"buttonBG1"];
    UIImage *buttonPressed = [UIImage imageNamed:@"buttonBG1"];
   
    //拉伸图片，传入的参数是多少需要保护，这里为宽高的一半
    buttonImage = [buttonImage stretchableImageWithLeftCapWidth: buttonImage.size.width * 0.5 topCapHeight: buttonImage.size.height * 0.5];
    buttonPressed = [buttonPressed stretchableImageWithLeftCapWidth:buttonPressed.size.width *0.5 topCapHeight:buttonPressed.size.height * 0.5];
    //设置不同状态下的图片
    [self.conformButton setBackgroundImage:buttonImage forState:UIControlStateNormal];
    [self.conformButton setBackgroundImage:buttonPressed forState:UIControlStateHighlighted];
   
}

- (void)setRegisterButton{

    UIImage *buttonImage = [UIImage imageNamed:@"buttonBG1"];
    UIImage *buttonPressed = [UIImage imageNamed:@"buttonBG1"];
    //拉伸图片，传入的参数是多少需要保护，这里为宽高的一半
    buttonImage = [buttonImage stretchableImageWithLeftCapWidth: buttonImage.size.width * 0.5 topCapHeight: buttonImage.size.height * 0.5];
    buttonPressed = [buttonPressed stretchableImageWithLeftCapWidth:buttonPressed.size.width *0.5 topCapHeight:buttonPressed.size.height * 0.5];
    //设置不同状态下的图片
 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)switchToRegister:(id)sender {
    
    self.conformButton.titleLabel.text = @"Register";
}

- (IBAction)swtichToLogin:(id)sender {
    
    self.conformButton.titleLabel.text = @"Login";

}



//- (IBAction)login:(id)sender {
//    
//    [self setVC];
//    [self presentViewController:self.drawerController animated:YES completion:nil];
//    
//}

- (void)setVC {
    UIViewController *centerVC = [[LitterLCenterViewController alloc]init];
    UIViewController *leftVC = [[LitterLLeftViewController alloc]init];
    UIViewController *rightVC = [[LitterLRightViewController alloc]init];
    //2、初始化导航控制器
    UINavigationController *centerNvaVC = [[UINavigationController alloc]initWithRootViewController:centerVC];
    UINavigationController *leftNvaVC = [[UINavigationController alloc]initWithRootViewController:leftVC];
    UINavigationController *rightNvaVC = [[UINavigationController alloc]initWithRootViewController:rightVC];
    
    //3、使用MMDrawerController
    self.drawerController = [[MMDrawerController alloc]initWithCenterViewController:centerNvaVC leftDrawerViewController:leftNvaVC rightDrawerViewController:rightNvaVC];
    
    //4、设置打开/关闭抽屉的手势
    self.drawerController.openDrawerGestureModeMask = MMOpenDrawerGestureModeAll;
    self.drawerController.closeDrawerGestureModeMask =MMCloseDrawerGestureModeAll;
    //5、设置左右两边抽屉显示的多少
    self.drawerController.maximumLeftDrawerWidth = 200;
    self.drawerController.maximumRightDrawerWidth = 200;
    //6、初始化窗口、设置根控制器、显示窗口
}

- (void)setPlayer{
    
    NSString *stringVideoName = @"welcomeVideo.mp4";
    NSString *stringVideoPath = [[NSBundle mainBundle] pathForResource:stringVideoName ofType:nil];
    NSURL *url = [NSURL fileURLWithPath:stringVideoPath];

    
    self.playerItem = [[AVPlayerItem alloc]initWithURL:url];
    self.player = [[AVPlayer alloc]initWithPlayerItem:self.playerItem];
    AVPlayerLayer *layer =  [[AVPlayerLayer alloc]init];
    layer.frame = self.view.bounds;
    layer.player = self.player;
    layer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    [self.view.layer insertSublayer:layer below:self.conformButton.layer];
    UIView *setColorView = [[UIView alloc]initWithFrame:self.view.bounds];
    [setColorView setBackgroundColor:[UIColor blackColor]];
    setColorView.alpha = 0.1;
    [self.view addSubview:setColorView];
    //self.view.alpha = 0.5;
   
    
    
//    self.playerViewController = [[AVPlayerViewController alloc] init];
//    self.playerViewController.player = [AVPlayer playerWithURL:url];
//  
//    self.playerViewController.view.frame = self.loginBGView.frame;
//    [self.loginBGView addSubview:_playerViewController.view];
//    self.loginBGView.alpha = 0;

}


- (void)testLayout{

    UIButton *button = [[UIButton alloc]init];
    //设置 layout
    
    //    [button setBackgroundColor:[UIColor purpleColor]];
    //    NSLayoutConstraint *constranint1 = [NSLayoutConstraint constraintWithItem:button attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1 constant:-20];
    //
    //    NSLayoutConstraint *constranint2 = [NSLayoutConstraint constraintWithItem:button attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1 constant:-20];
    //
    //    NSLayoutConstraint *constranint3 = [NSLayoutConstraint constraintWithItem:button attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:-20];
    //
    //    NSLayoutConstraint *constranint4 = [NSLayoutConstraint constraintWithItem:button attribute:NSLayoutAttributeBottom  relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1 constant:-20];
    //
    //     [button addConstraint:constranint1];
    //     [button addConstraint:constranint2];
    //     [button addConstraint:constranint3];
    //     [button addConstraint:constranint4];
    //    [self.view addSubview:button];
}

- (IBAction)conformButtonClick:(id)sender {
    
    [self setVC];
    [self presentViewController:self.drawerController animated:YES completion:nil];
}
@end



