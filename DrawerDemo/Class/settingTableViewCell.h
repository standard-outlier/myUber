//
//  settingTableViewCell.h
//  网易彩票
//
//  Created by 张帆 on 16/4/10.
//  Copyright © 2016年 fans. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "settingTableViewCell.h"
#import "itemSwitch.h"
#import "itemArrow.h"
#import "itemLable.h"

@interface settingTableViewCell : UITableViewCell
@property (nonatomic,strong) UIImageView *imageArrow;
@property (nonatomic,strong) UISwitch *itemSwitch;
@property (nonatomic,strong) UILabel *itemLable;
@property (nonatomic,copy) NSString *key;
- (settingTableViewCell *)cellWithTableView:(UITableView *)tableView andModel:(itemModel*)model andreuseID:(NSString *)reuseID;
+ (settingTableViewCell *)setTableView:(UITableView *)tableView andModel:(itemModel*)model andreuseID:(NSString *)reuseID;
- (void)clickSwitch;
@end
