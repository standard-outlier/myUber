//
//  myScheduleViewController.m
//  DrawerDemo
//
//  Created by 张帆 on 16/4/22.
//  Copyright © 2016年 LJY. All rights reserved.
//

#import "myScheduleViewController.h"
#import "itemSwitch.h"
@interface myScheduleViewController ()

@end

@implementation myScheduleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setSection1];
    [self setSection2];
    [self setSection3];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setSection1{
    itemModel *item1 = [[itemArrow alloc]initWithTitle:@"Vochers" andicon:nil anddestVcClass:nil];

    sectionModel *section1 = [[sectionModel alloc]init];
    section1.items = @[item1];
    [self.date addObject:section1];
}

-(void)setSection2{
    itemModel *item1 = [[itemArrow alloc]initWithTitle:@"Integral" andicon:nil anddestVcClass:nil];
    itemModel *item2 = [[itemSwitch alloc]initWithTitle:@"Merchants Securities" andicon:nil];
    sectionModel *section2 = [[sectionModel alloc]init];
    section2.items = @[item1,item2];
    [self.date addObject:section2];
}

-(void)setSection3{
    itemModel *item1 = [[itemSwitch alloc]initWithTitle:@"Automatic Payment" andicon:nil];
    itemModel *item2 = [[itemSwitch alloc]initWithTitle:@"Invoice" andicon:nil];
    sectionModel *section3 = [[sectionModel alloc]init];
    section3.items = @[item1,item2];
    [self.date addObject:section3];
}
@end
