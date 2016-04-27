

#import "LitterLCenterViewController.h"
#import "UIViewController+MMDrawerController.h"
#import "MMDrawerBarButtonItem.h"
#import "LoginandRegisterViewController.h"
#import "itemArrow.h"
#import "itemModel.h"
#import "sectionModel.h"
@interface LitterLCenterViewController ()

@end

@implementation LitterLCenterViewController


/**
 *  加载控制器的时候设置打开抽屉模式  (因为在后面会关闭)
 */
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //设置打开抽屉模式
  

    
}


//- (void)setleftNavItemImage{
//
//    
//    CGSize size = CGSizeMake(25, 25);
//    UIImage *image = [UIImage imageNamed:@"memu"];
//    cell.imageView.image = image;
//    CGRect rect = self.imageView.frame;
//    rect.size = size;
//    cell.imageView.frame = rect;
//    
//    //set graphices（待理解）
//    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
//    CGRect imageRect = CGRectMake(0.0, 0.0, size.width, size.height);
//    [image drawInRect:imageRect];
//    cell.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//
//}


- (void)viewDidLoad {
    [super viewDidLoad];
        //self.title = @"Demo";
    [self.view setBackgroundColor:[UIColor whiteColor]];
    //1、设置导航栏的按钮

    //self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"memu"] style:UIBarButtonItemStylePlain target:self action:@selector(leftBtn)];
    

//    UIButton *lefbuttons = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
//    UIImage *leftImage = [UIImage imageNamed:@"memu"];
//    
//    [lefbuttons setImage:leftImage forState:UIControlStateNormal];
//    [lefbuttons addTarget:self action:@selector(leftBtn) forControlEvents:UIControlEventTouchDown];
//    
//    UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc]initWithCustomView:lefbuttons];
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *image = [UIImage imageNamed:@"more"];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    [btn setImage:image forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(leftBtn) forControlEvents:UIControlEventTouchUpInside];
    [btn sizeToFit];
    UIView *containView = [[UIView alloc]initWithFrame:btn.bounds];
    [containView addSubview:btn];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:containView];

    
    
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"more"] style:UIBarButtonItemStylePlain target:self action:@selector(rightBtn)];
    
    
    
    //框架作者提供了创建UIBarButtonItem的方法
        //self.navigationItem.leftBarButtonItem = [[MMDrawerBarButtonItem alloc]initWithTarget:self action:@selector(leftBtn)];
    //    self.navigationItem.rightBarButtonItem = [[MMDrawerBarButtonItem alloc]initWithTarget:self action:@selector(rightBtn)];
    
    
    //2、添加双击手势
    UITapGestureRecognizer * doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTap:)];
    //2.1、双击
    [doubleTap setNumberOfTapsRequired:2];
    [self.view addGestureRecognizer:doubleTap];
    
    //3、添加两个手指双击手势
    UITapGestureRecognizer * twoFingerDoubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(twoFingerDoubleTap:)];
    //3.1、双击
    [twoFingerDoubleTap setNumberOfTapsRequired:2];
    //3.2、两个手指  默认为一个
    [twoFingerDoubleTap setNumberOfTouchesRequired:2];
    [self.view addGestureRecognizer:twoFingerDoubleTap];
}

-(void)leftBtn{
     //这里的话是通过遍历循环拿到之前在AppDelegate中声明的那个MMDrawerController属性，然后判断是否为打开状态，如果是就关闭，否就是打开(初略解释，里面还有一些条件)
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
}
-(void)rightBtn{
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideRight animated:YES completion:nil];
}

/**
 *  添加点击手势  一个手指双击
 */
-(void)doubleTap:(UITapGestureRecognizer*)gesture{
    [self.mm_drawerController bouncePreviewForDrawerSide:MMDrawerSideLeft completion:nil];
}

/**
 *  添加点击手势  两个个手指双击
 */
-(void)twoFingerDoubleTap:(UITapGestureRecognizer*)gesture{
    [self.mm_drawerController bouncePreviewForDrawerSide:MMDrawerSideRight completion:nil];
}


@end
