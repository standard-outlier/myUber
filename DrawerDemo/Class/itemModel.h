//
//  intemModel.h
//  网易彩票
//
//  Created by 张帆 on 16/4/10.
//  Copyright © 2016年 fans. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^cellOption)();

@interface itemModel : NSObject
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *icon;
@property (nonatomic,copy) cellOption option;
@property (nonatomic,strong) NSString *lableText;

-(instancetype)initWithTitle:(NSString *)title andicon:(NSString *)icon;
+(instancetype *)initWithTitle:(NSString *)title andicon:(NSString *)icon;
-(instancetype)initWithTitle:(NSString *)title andicon:(NSString *)icon andItemLableText:(NSString *)text;
@end
