//
//  itemArrow.m
//  网易彩票
//
//  Created by 张帆 on 16/4/14.
//  Copyright © 2016年 fans. All rights reserved.
//

#import "itemArrow.h"

@implementation itemArrow
- (instancetype)initWithTitle:(NSString *)title andicon:(NSString *)icon anddestVcClass:(__unsafe_unretained Class)destVcClass{
    self.title = title;
    self.icon = icon;
    self.destin = destVcClass;
    return self;
}
@end
