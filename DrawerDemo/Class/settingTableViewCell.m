//
//  settingTableViewCell.m
//  网易彩票
//
//  Created by 张帆 on 16/4/10.
//  Copyright © 2016年 fans. All rights reserved.
//
#import "settingTableViewCell.h"

@interface settingTableViewCell()

@end

@implementation settingTableViewCell
//初始化 cell 箭头指示
- (UIImageView *)imageArrow{
    if (_imageArrow == nil) {
        _imageArrow = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"CellArrow"]];
    }
    return _imageArrow;
}
//初始化 cell 开关
- (UISwitch *)itemSwitch{
    if (_itemSwitch == nil) {
        _itemSwitch = [[UISwitch alloc]init];
        [_itemSwitch addTarget:self action:@selector(clickSwitch) forControlEvents:UIControlEventValueChanged];
        _itemSwitch.on = YES;
        //self.userInteractionEnabled = YES;
            }
    return _itemSwitch;
}
//监听switch 的点击

//初始化  右边的lable
- (UILabel *)itemLable{
    if (_itemLable == nil) {
        UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 80, self.frame.size.height)];

    }
    return _itemLable;
}

//创建 cell

- (settingTableViewCell *)cellWithTableView:(UITableView *)tableView andModel:(itemModel*)model andreuseID:(NSString *)reuseID{
  settingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
    if (cell == nil) {
        cell = [[settingTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuseID];
        
    }
    cell.userInteractionEnabled = YES;
    if ([model isKindOfClass:[itemSwitch class]]) {
        //NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults]

        cell.accessoryView = self.itemSwitch;
        cell.accessoryView.userInteractionEnabled = YES;
        //self.itemSwitch.on  = [defaults boolForKey:self.key];
        
    }else if (model.option){
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }else if ([model isKindOfClass:[itemArrow class]]){
        
        cell.accessoryView = self.imageArrow;
        
        
    }else if ([model isKindOfClass:[itemLable class]]){
        cell.detailTextLabel.text = model.lableText;
        
    }else if ([model isKindOfClass:[itemModel class]]){
        
        cell.accessoryView = nil;
        
    }
    

    CGRect imageRect = self.imageView.frame;
    imageRect.size = CGSizeMake(10, 10);
    UIImage *image = [UIImage imageNamed:model.icon];

    cell.imageView.image = image;
    cell.imageView.frame = imageRect;
        //调整image的大小
    
    cell.textLabel.text = model.title;
    cell.detailTextLabel.text = model.lableText;
    cell.textLabel.textColor = [UIColor whiteColor];
    UIColor *myColor = [UIColor colorWithRed:39.0/255 green:47.0/255 blue:55.0/255 alpha:1];
    [cell setBackgroundColor:myColor];
    return cell;
    
}

//类方法
+ (settingTableViewCell *)setTableView:(UITableView *)tableView andModel:(itemModel*)model andreuseID:(NSString *)reuseID{
    return [[self alloc]cellWithTableView:tableView andModel:model andreuseID:reuseID];
}

@end
