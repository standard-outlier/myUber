//
//  itemArrow.h
//  网易彩票
//
//  Created by 张帆 on 16/4/14.
//  Copyright © 2016年 fans. All rights reserved.
//

#import "itemModel.h"

@interface itemArrow : itemModel
@property (nonatomic,assign)Class destin;//在一个属性中存放一个类，assign
- (instancetype)initWithTitle:(NSString *)title andicon:(NSString *)icon anddestVcClass:(__unsafe_unretained Class)destVcClass;
@end
