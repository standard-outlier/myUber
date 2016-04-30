

#import "LitterLLeftViewController.h"
#import "LitterLShowViewController.h"
#import "LitterLCenterViewController.h"
#import "UIViewController+MMDrawerController.h"
#import "sectionModel.h"
#import "myScheduleViewController.h"
#import "myInfo.h"
@interface LitterLLeftViewController ()

@end

@implementation LitterLLeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIColor *myColor = [UIColor colorWithRed:39.0/255 green:47.0/255 blue:55.0/255 alpha:1];
    [self setHeaderView];
    [self.view setBackgroundColor:myColor];
    self.title = @"个人信息";
    [self setSection1];

}


-(void)viewWillAppear:(BOOL)animated{
   
    self.navigationController.navigationBarHidden = YES;
    
}
- (void)setHeaderView{
    UIColor *myColor = [UIColor colorWithRed:39.0/255 green:47.0/255 blue:55.0/255 alpha:1];

    NSArray *nibArray = [[NSBundle mainBundle]loadNibNamed:@"myInfo" owner:nil options:nil];
    myInfo *myinfo = [nibArray firstObject];
    myinfo.backgroundColor = myColor;
    myinfo.center = CGPointMake(self.view.center.x, 20);
    
    [myinfo.myImage setBackgroundImage:[UIImage imageNamed:@"myInfo"] forState:UIControlStateNormal];
    myinfo.myName.text = @"Dawson";
    self.tableView.tableHeaderView = myinfo;
}


-(void)setSection1{
    itemModel *item1 = [[itemArrow alloc]initWithTitle:@"My schedule" andicon:@"landTaxiHis" anddestVcClass:[ LitterLShowViewController class]];
    itemModel *item2 = [[itemArrow alloc]initWithTitle:@"My wallet" andicon:@"wallate" anddestVcClass:[myScheduleViewController class]];
    itemModel *item3 = [[itemArrow alloc]initWithTitle:@"Reservation" andicon:@"taxiLocation"];
    itemModel *item4 = [[itemArrow alloc]initWithTitle:@"Message" andicon:@"noti"];
    itemModel *item5 = [[itemArrow alloc]initWithTitle:@"Install" andicon:@"setting"];
    itemModel *item6 = [[itemArrow alloc]initWithTitle:@"About" andicon:@"aboutUs"];
    itemModel *item7 = [[itemArrow alloc]initWithTitle:nil andicon:nil anddestVcClass:nil];
    sectionModel *section1 = [[sectionModel alloc]init];
    section1.items = @[item1,item2,item3,item4,item5,item6,item7];
    [self.date addObject:section1];
}

#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
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
        
        UINavigationController* nav = (UINavigationController*)self.mm_drawerController.centerViewController;
        //[nav presentViewController:readToPushVC animated:YES completion:nil];
        [nav pushViewController:readToPushVC animated:YES];

        [self.mm_drawerController closeDrawerAnimated:YES completion:^(BOOL finished) {
            
             //当我们push成功之后，关闭我们的抽屉
            [self.mm_drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModePanningCenterView];
        }];

    }

    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0;
}


@end
