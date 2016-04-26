//
//  sectionModel.h
//  网易彩票
//
//  Created by 张帆 on 16/4/10.
//  Copyright © 2016年 fans. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "itemModel.h"
@interface sectionModel : NSObject
@property (nonatomic,copy) NSString *footer;
@property (nonatomic,copy) NSString *header;
@property (nonatomic,strong) NSMutableArray *items;
- (id)initWithFooter:(NSString *)footer andHeader:(NSString *)header;
+ (id)initialWithFooter:(NSString *)footer andHeader:(NSString *)header;
@end
