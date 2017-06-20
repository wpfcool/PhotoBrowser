//
//  WFPhotoBrowserController.m
//  WFPhotoBrowser
//
//  Created by wenpeifang on 2017/6/20.
//  Copyright © 2017年 wenpeifang. All rights reserved.
//

#import "WFPhotoBrowserController.h"
#import "WFPhotoBrowserView.h"
#define WFDEVICEWIDTH  ([UIScreen mainScreen].bounds.size.width)
#define WFDEVICEHEIGHT ([UIScreen mainScreen].bounds.size.height)
@interface WFPhotoBrowserController ()<WFPhotoBrowserViewDelegate>
@property (nonatomic,strong)WFPhotoBrowserView * browserView;

@end

@implementation WFPhotoBrowserController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = [UIColor whiteColor];
    _browserView = [[WFPhotoBrowserView alloc]initWithFrame:CGRectMake(0, 0, WFDEVICEWIDTH, WFDEVICEHEIGHT)];
    _browserView.delegate = self;
    _browserView.arrayOfImages = _images;
    _browserView.currentPage = _currentIndex;
    [self.view addSubview:_browserView];
    
    

    
//    UIToolbar * toolNar = [];

}


-(void)userDidTapClose{
    [self.navigationController popViewControllerAnimated:YES];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
