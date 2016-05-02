//
//  myWalletViewController.m
//  DrawerDemo
//
//  Created by 张帆 on 16/4/22.
//  Copyright © 2016年 LJY. All rights reserved.
//

#import "myWalletViewController.h"

@interface myWalletViewController ()

@end

@implementation myWalletViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIColor *myColor = [UIColor colorWithRed:39.0/255 green:47.0/255 blue:55.0/255 alpha:1];
    
    [self.view setBackgroundColor:myColor];
    self.tableView.tableFooterView.backgroundColor = myColor;
    [self setSection1];
    [self setSection2];
    [self setSection3];

}

-(void)setSection1{
    itemModel *item1 = [[itemArrow alloc]initWithTitle:@"Coupon" andicon:@"autoPay"anddestVcClass:nil];
    
    sectionModel *section1 = [[sectionModel alloc]init];
    section1.items = @[item1];
    [self.date addObject:section1];
}

-(void)setSection2{
    itemModel *item1 = [[itemArrow alloc]initWithTitle:@"Point" andicon:@"point" anddestVcClass:nil];
    itemModel *item2 = [[itemSwitch alloc]initWithTitle:@"Redeem" andicon:@"Redeem"];
    
    sectionModel *section2 = [[sectionModel alloc]init];
    section2.items = @[item1,item2];
    [self.date addObject:section2];
}

-(void)setSection3{
    itemModel *item1 = [[itemSwitch alloc]initWithTitle:@"Automatic Payment" andicon:@"autoPay"];
    itemModel *item2 = [[itemSwitch alloc]initWithTitle:@"Receipt" andicon:@"receipt"];
    sectionModel *section3 = [[sectionModel alloc]init];
    section3.items = @[item1,item2];
    [self.date addObject:section3];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 20;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)sectio{
    UIColor *myColor = [UIColor colorWithRed:39.0/255 green:47.0/255 blue:55.0/255 alpha:1];
    CGRect rect = CGRectMake(0, 0, self.view.frame.size.width, 30);
    UIView *headView = [[UIView alloc]initWithFrame:rect];
    [headView setBackgroundColor:myColor];
    return headView;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)sectio{
    UIColor *myColor = [UIColor colorWithRed:39.0/255 green:47.0/255 blue:55.0/255 alpha:1];
    CGRect rect = CGRectMake(0, 0, self.view.frame.size.width, 30);
    UIView *headView = [[UIView alloc]initWithFrame:rect];
    [headView setBackgroundColor:myColor];
    return headView;
}

@end
