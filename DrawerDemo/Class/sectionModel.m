//
//  sectionModel.m
//  网易彩票
//
//  Created by 张帆 on 16/4/10.
//  Copyright © 2016年 fans. All rights reserved.
//

#import "sectionModel.h"

@implementation sectionModel
- (id)initWithFooter:(NSString *)footer andHeader:(NSString *)header{
    self.footer = footer;

    self.header = header;
    return self;
}
+ (id)initialWithFooter:(NSString *)footer andHeader:(NSString *)header{
    //return [[sectionModel alloc]initWithFooter:header andHeader:footer];
    return [[sectionModel alloc]initWithFooter:footer andHeader:header];
   
}
@end
