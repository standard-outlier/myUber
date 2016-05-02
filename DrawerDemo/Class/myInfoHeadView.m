//
//  myInfoHeadView.m
//  myUber
//
//  Created by 张帆 on 16/5/1.
//  Copyright © 2016年 LJY. All rights reserved.
//

#import "myInfoHeadView.h"

@implementation myInfoHeadView

-(void)awakeFromNib{
    UIColor *myColor = [UIColor colorWithRed:39.0/255 green:47.0/255 blue:55.0/255 alpha:1];
    self.backgroundColor = myColor;
    self.text.textColor = [UIColor whiteColor];
    self.text.text = @"Profile Photo";
    UIImage *image = [UIImage imageNamed:@"myInfo1"];
    UIButton *imageButton = [[UIButton alloc]init];
    [imageButton setBackgroundImage:image forState:UIControlStateNormal];
    self.image = imageButton;
}

@end
