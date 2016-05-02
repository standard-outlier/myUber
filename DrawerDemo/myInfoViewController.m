//
//  myInfoViewController.m
//  DrawerDemo
//
//  Created by 张帆 on 16/4/22.
//  Copyright © 2016年 LJY. All rights reserved.
//

#import "myInfoViewController.h"
#import "myInfoHeadView.h"
@interface myInfoViewController ()

@end

@implementation myInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIColor *myColor = [UIColor colorWithRed:39.0/255 green:47.0/255 blue:55.0/255 alpha:1];
    
    [self.view setBackgroundColor:myColor];
    [self setTableHeadView];
    [self setLeftBackButton];
    [self setSection1];
    [self setSection2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    //self.navigationController.navigationBarHidden = NO;
    
}

- (void)setSection1{

    itemModel *item1 = [[itemLable alloc]initWithTitle:nil andicon:nil ];
    itemModel *item2 = [[itemLable alloc]initWithTitle:@"Name" andicon:nil andItemLableText:@"Dawson"];
    
    itemModel *item3 = [[itemLable alloc]initWithTitle:@"Gender" andicon:nil andItemLableText:@"Male"];
    itemModel *item4 = [[itemLable alloc]initWithTitle:@"Age" andicon:nil andItemLableText:@"21"];
    
   itemModel *item5 = [[itemLable alloc]initWithTitle:@"Phone Number" andicon:nil andItemLableText:@"133****8888"];
    
    itemModel *item6 = [[itemLable alloc]initWithTitle:@"My Signature" andicon:nil andItemLableText:@"Not Set"];
    
    itemModel *item7 = [[itemLable alloc]initWithTitle:@"My Grades" andicon:nil andItemLableText:@"V2"];
    
    sectionModel *section1 = [[sectionModel alloc]init];
    section1.items = @[item1,item2,item3,item4,item5,item6,item7];
    [self.date addObject:section1];

}


- (void)setSection2{
    itemModel *item1 = [[itemLable alloc]initWithTitle:@"Company" andicon:nil andItemLableText:@"Not Set"];
    
    itemModel *item2 = [[itemLable alloc]initWithTitle:@"Job" andicon:nil andItemLableText:@"Not Set"];
    
    sectionModel *section1 = [[sectionModel alloc]init];
    section1.items = @[item1,item2];
    [self.date addObject:section1];

}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 30;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)sectio{
    UIColor *myColor = [UIColor colorWithRed:39.0/255 green:47.0/255 blue:55.0/255 alpha:1];
    CGRect rect = CGRectMake(0, 0, self.view.frame.size.width, 30);
    UIView *headView = [[UIView alloc]initWithFrame:rect];
    [headView setBackgroundColor:myColor];
    return headView;
}

-(void)setTableHeadView{

    NSArray *viewArray = [[NSBundle mainBundle]loadNibNamed:@"myInfoHeadView" owner:nil options:nil];
    myInfoHeadView *headView = [viewArray firstObject];
    headView.frame = CGRectMake(0, 0, self.view.frame.size.width, 80);
    self.tableView.tableHeaderView = headView;
}

- (void)setLeftBackButton{
    CGRect leftButtonFrame = CGRectMake(0, 0, 25, 25);
    UIButton *leftButton = [[UIButton alloc]initWithFrame:leftButtonFrame];
    UIImage *image = [UIImage imageNamed:@"backIcon"];
    [leftButton setBackgroundImage:image forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(backClicked) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = leftBarButton;
    

}




-(void)backClicked{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
