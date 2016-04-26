//
//  intemModel.m
//  网易彩票
//
//  Created by 张帆 on 16/4/10.
//  Copyright © 2016年 fans. All rights reserved.
//

#import "itemModel.h"

@implementation itemModel

-(instancetype)initWithTitle:(NSString *)title andicon:(NSString *)icon{//__unsafe_unretained 相当于 weak
    self.title = title;
    self.icon = icon;
    return self;
}

+(instancetype *)initWithTitle:(NSString *)title andicon:(NSString *)icon{
    return [self initWithTitle:title andicon:icon];
}

-(instancetype)initWithTitle:(NSString *)title andicon:(NSString *)icon andItemLableText:(NSString *)text{
    self.title = title;
    self.icon = icon;
    self.lableText = text;
    return self;
}

@end
