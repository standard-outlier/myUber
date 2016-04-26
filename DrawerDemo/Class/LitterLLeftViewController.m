

#import "LitterLLeftViewController.h"
#import "LitterLShowViewController.h"
#import "LitterLCenterViewController.h"
#import "UIViewController+MMDrawerController.h"
#import "sectionModel.h"
#import "myScheduleViewController.h"
@interface LitterLLeftViewController ()

@end

@implementation LitterLLeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIColor *myColor = [UIColor colorWithRed:39.0/255 green:47.0/255 blue:55.0/255 alpha:1];
    [self.view setBackgroundColor:myColor];
    self.title = @"个人信息";
    [self setSection1];

}

-(void)setSection1{
    itemModel *item1 = [[itemArrow alloc]initWithTitle:@"My schedule" andicon:@"fanhui" anddestVcClass:[ LitterLShowViewController class]];
    itemModel *item2 = [[itemArrow alloc]initWithTitle:@"My wallet" andicon:@"fanhui" anddestVcClass:[myScheduleViewController class]];
    itemModel *item3 = [[itemArrow alloc]initWithTitle:@"Reservation" andicon:@"fanhui"];
    itemModel *item4 = [[itemArrow alloc]initWithTitle:@"Message" andicon:@"fanhui"];
    itemModel *item5 = [[itemArrow alloc]initWithTitle:@"Install" andicon:@"fanhui"];
    itemModel *item6 = [[itemArrow alloc]initWithTitle:@"About" andicon:@"fanhui"];
    sectionModel *section1 = [[sectionModel alloc]init];
    section1.items = @[item1,item2,item3,item4,item5,item6];
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
