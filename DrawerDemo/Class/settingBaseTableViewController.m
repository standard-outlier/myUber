//
//  settingTableViewController.m
//  网易彩票
//
//  Created by 张帆 on 16/4/10.
//  Copyright © 2016年 fans. All rights reserved.
//

#import "settingBaseTableViewController.h"
#import "itemModel.h"
#import "itemArrow.h"
#import "itemSwitch.h"
#import "itemLable.h"
#import "settingTableViewCell.h"
#import "sectionModel.h"


@implementation settingBaseTableViewController

- (NSMutableArray *)date{
    if (_date == nil) {
        
        _date = [NSMutableArray array];
    
    }
    return _date;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    UIColor *myColor = [UIColor colorWithRed:29/255 green:37/255 blue:46/255 alpha:1];
    [self.tableView setBackgroundColor:myColor];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return _date.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    sectionModel *tempArray = _date[section];
    return tempArray.items.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
 
    sectionModel *tempArray = _date[indexPath.section];
    settingTableViewCell *cell = [settingTableViewCell setTableView:tableView andModel:tempArray.items[indexPath.row] andreuseID:@"setting"];
    return cell;
    
}


//- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
//    UILabel *footer = [[UILabel alloc]init];
////    footer.font = [UIFont systemFontOfSize:14];
//    footer.textColor = [UIColor grayColor];
//    footer.numberOfLines = 0;
//    sectionModel *tempItem = self.date[section];
//    footer.text = tempItem.footer;
//    return footer;
//    
//}
//
//-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    UILabel *head = [[UILabel alloc]init];
//    head.font = [UIFont systemFontOfSize:14];
//    head.textColor = [UIColor grayColor];
//    head.numberOfLines = 0;
//    sectionModel *tempItem = self.date[section];
//    head.text = tempItem.header;
//    return head;
//    
//}

//设置 tableview 的head，footer 的高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 20.;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 20;
}

//设置点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    sectionModel *tempSection = self.date[indexPath.section];
    itemModel *tempModel = tempSection.items[indexPath.row];
    if (tempModel.option) {
        tempModel.option();
    }
    if ([tempModel isKindOfClass:[itemArrow class]]) {
        itemArrow *itemarrow = (itemArrow *)tempModel;
        
        if (itemarrow.destin == nil) return;
        UIViewController *readToPushVC = [[itemarrow.destin alloc]init];
        readToPushVC.title = itemarrow.title;
        [self.navigationController pushViewController:readToPushVC animated:YES];
    }
   
    
}




@end
