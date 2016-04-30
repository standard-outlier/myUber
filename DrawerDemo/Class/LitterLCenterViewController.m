

#import "LitterLCenterViewController.h"
#import "UIViewController+MMDrawerController.h"
#import "MMDrawerBarButtonItem.h"
#import "LoginandRegisterViewController.h"
#import "itemArrow.h"
#import "itemModel.h"
#import "sectionModel.h"
#import <MapKit/MapKit.h>
@interface LitterLCenterViewController ()

@property(nonatomic,strong) MKMapView *mapView;
@property (nonatomic,strong)CLLocationManager *locationManager;


@end

@implementation LitterLCenterViewController


/**
 *  加载控制器的时候设置打开抽屉模式  (因为在后面会关闭)
 */
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //[self setNaviagationBarColor];

}


- (void)viewDidLoad {
    [super viewDidLoad];
    //[self setNaviagationBarColor];
    [self.view addSubview:self.mapView];
    [self setNavItem];
    }

- (void)setNavItem{
   //left
    UIButton *leftbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftbtn.frame = CGRectMake(0, 0, 20, 20);
    UIImage *image = [UIImage imageNamed:@"memu"];
    [leftbtn setImage:image forState:UIControlStateNormal];
    [leftbtn addTarget:self action:@selector(leftBtn) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc]initWithCustomView:leftbtn];
    self.navigationItem.leftBarButtonItem = leftBarButton;
    
    //right
    UIButton *rightbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightbtn.frame = CGRectMake(0, 0, 20, 20);
    UIImage *image1 = [UIImage imageNamed:@"more"];
    [rightbtn setImage:image1 forState:UIControlStateNormal];
    [rightbtn addTarget:self action:@selector(rightBtn) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc]initWithCustomView:rightbtn];
    self.navigationItem.rightBarButtonItem = rightBarButton;
    
}

- (UIStatusBarStyle)preferredStatusBarStyle{
    [super preferredStatusBarStyle];
    return UIStatusBarStyleLightContent;
}

- (void)setNaviagationBarClear{

    self.navigationController.navigationBar.translucent = YES;
    UIColor *color = [UIColor clearColor];
    CGRect rect = CGRectMake(0.0f, 0.0f, self.view.frame.size.width, 64);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.clipsToBounds = NO;
    
}

-(void)setNaviagationBarColor{
    
    UIColor *color = [UIColor redColor];
    CGRect frame = self.navigationController.navigationBar.frame;
   UIView *alphaView = [[UIView alloc] initWithFrame:CGRectMake(0, -20, frame.size.width, frame.size.height+20)];
    [alphaView setBackgroundColor:color];
    alphaView.userInteractionEnabled = NO;

    [self.navigationController.navigationBar insertSubview: alphaView atIndex:0];
    

}



-(void)leftBtn{
     //这里的话是通过遍历循环拿到之前在AppDelegate中声明的那个MMDrawerController属性，然后判断是否为打开状态，如果是就关闭，否就是打开(初略解释，里面还有一些条件)
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];


}

-(void)rightBtn{
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideRight animated:YES completion:nil];
}

//初始化地图界面
-(MKMapView *)mapView{
    if (_mapView == nil) {
        _mapView = [[MKMapView alloc]initWithFrame:self.view.bounds];
        CLLocationManager *manager = [[CLLocationManager alloc]init];
        _locationManager = manager;
        _mapView.userTrackingMode = MKUserTrackingModeFollow;
        _mapView.mapType = MKMapTypeStandard;
        _mapView.showsTraffic = YES;
        _mapView.delegate = self;
    }
    return _mapView;
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation{
    //创建编码对象
    CLGeocoder *geocoder=[[CLGeocoder alloc]init];
    //反地理编码
    [geocoder reverseGeocodeLocation:userLocation.location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        if (error!=nil || placemarks.count==0) {
            return ;
        }
        //获取地标
        CLPlacemark *placemark=[placemarks firstObject];
        //设置标题
        userLocation.title=placemark.locality;
        //设置子标题
        userLocation.subtitle=placemark.name;
    }];
    
}
//地图：回到当前地址
- (IBAction)backCurrentLocation:(id)sender {
    
    MKCoordinateSpan span=MKCoordinateSpanMake(0.021251, 0.016093);
    
    [self.mapView setRegion:MKCoordinateRegionMake(self.mapView.userLocation.coordinate, span) animated:YES];
}

//当区域改变时调用
- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated
{
    //获取系统默认定位的经纬度跨度
    NSLog(@"维度跨度:%f,经度跨度:%f",mapView.region.span.latitudeDelta,mapView.region.span.longitudeDelta);
}

//缩小地图
- (IBAction)minMapView:(id)sender {
    
    //获取维度跨度并放大一倍
    CGFloat latitudeDelta = self.mapView.region.span.latitudeDelta * 2;
    //获取经度跨度并放大一倍
    CGFloat longitudeDelta = self.mapView.region.span.longitudeDelta * 2;
    //经纬度跨度
    MKCoordinateSpan span = MKCoordinateSpanMake(latitudeDelta, longitudeDelta);
    //设置当前区域
    MKCoordinateRegion region = MKCoordinateRegionMake(self.mapView.centerCoordinate, span);
    
    [self.mapView setRegion:region animated:YES];
}

//放大地图
- (IBAction)maxMapView:(id)sender {
    
    //获取维度跨度并缩小一倍
    CGFloat latitudeDelta = self.mapView.region.span.latitudeDelta * 0.5;
    //获取经度跨度并缩小一倍
    CGFloat longitudeDelta = self.mapView.region.span.longitudeDelta * 0.5;
    //经纬度跨度
    MKCoordinateSpan span = MKCoordinateSpanMake(latitudeDelta, longitudeDelta);
    //设置当前区域
    MKCoordinateRegion region = MKCoordinateRegionMake(self.mapView.centerCoordinate, span);
    
    [self.mapView setRegion:region animated:YES];
    
}

-(void)doubleTap:(UITapGestureRecognizer*)gesture{
    [self.mm_drawerController bouncePreviewForDrawerSide:MMDrawerSideLeft completion:nil];
}

/**
 *  添加点击手势  两个个手指双击
 */
-(void)twoFingerDoubleTap:(UITapGestureRecognizer*)gesture{
    [self.mm_drawerController bouncePreviewForDrawerSide:MMDrawerSideRight completion:nil];
}

- (void)forlater{
    
    //    //2、添加双击手势
    //    UITapGestureRecognizer * doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTap:)];
    //    //2.1、双击
    //    [doubleTap setNumberOfTapsRequired:2];
    //    [self.view addGestureRecognizer:doubleTap];
    //
    //    //3、添加两个手指双击手势
    //    UITapGestureRecognizer * twoFingerDoubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(twoFingerDoubleTap:)];
    //    //3.1、双击
    //    [twoFingerDoubleTap setNumberOfTapsRequired:2];
    //    //3.2、两个手指  默认为一个
    //    [twoFingerDoubleTap setNumberOfTouchesRequired:2];
    //    [self.view addGestureRecognizer:twoFingerDoubleTap];
}
@end
