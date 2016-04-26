//
//  LoginandRegisterViewController.h
//  DrawerDemo
//
//  Created by 张帆 on 16/4/22.
//  Copyright © 2016年 LJY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginandRegisterViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *conformButton;

@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *pwdTextField;

- (IBAction)swtichToLogin:(id)sender;
- (IBAction)switchToRegister:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *loginIndicate;
@property (weak, nonatomic) IBOutlet UIButton *registerIndicate;
- (IBAction)conformButtonClick:(id)sender;

@end
