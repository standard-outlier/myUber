

#import "LitterLRightViewController.h"
#import "sectionModel.h"
#import "itemModel.h"
#import "itemArrow.h"
#import "LitterLShowViewController.h"
#import "UIViewController+MMDrawerController.h"
@interface LitterLRightViewController ()

@end

@implementation LitterLRightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Right-Demo";
}

-(void)setSection1{
    itemModel *item1 = [[itemArrow alloc]initWithTitle:@"My schedule" andicon:nil];
    itemModel *item2 = [[itemArrow alloc]initWithTitle:@"My wallet" andicon:nil];
    itemModel *item3 = [[itemArrow alloc]initWithTitle:@"Reservation" andicon:nil];
    itemModel *item4 = [[itemArrow alloc]initWithTitle:@"Message" andicon:nil];
    itemModel *item5 = [[itemArrow alloc]initWithTitle:@"Install" andicon:nil];
    itemModel *item6 = [[itemArrow alloc]initWithTitle:@"About" andicon:nil];
    sectionModel *section1 = [[sectionModel alloc]init];
    section1.items = @[item1,item2,item3,item4,item5,item6];
    [self.date addObject:section1];
}


#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    LitterLShowViewController *showVC = [[LitterLShowViewController alloc]init];
    showVC.title = [NSString stringWithFormat:@"Right-Demo%ld",indexPath.row];
    UINavigationController* nav = (UINavigationController*)self.mm_drawerController.centerViewController;
    [nav pushViewController:showVC animated:NO];
    [self.mm_drawerController closeDrawerAnimated:YES completion:^(BOOL finished) {
        [self.mm_drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeNone];
    }];
}
@end
