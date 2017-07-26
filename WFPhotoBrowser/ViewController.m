//
//  ViewController.m
//  WFPhotoBrowser
//
//  Created by wenpeifang on 2017/6/16.
//  Copyright © 2017年 wenpeifang. All rights reserved.
//

#import "ViewController.h"
#import "LoopViewController.h"
#import "WFPhotoBrowserController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)loopClick:(id)sender {
    WFPhotoBrowserController * loopVC = [[WFPhotoBrowserController alloc]init];
    loopVC.images = @[@"http://img.bbs.cnhubei.com/forum/dvbbs/2004-4/200441915031894.jpg",@"http://img5.duitang.com/uploads/item/201407/27/20140727202737_sZLAX.jpeg",@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1497954027405&di=3cb62e6a21ce1242b68d87abc49cc4ec&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimgad%2Fpic%2Fitem%2Fd000baa1cd11728b0983d70cc2fcc3cec3fd2c75.jpg",@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1497954072210&di=23f6736d775f52c3edef3592cec9cf20&imgtype=0&src=http%3A%2F%2Fpic2.ooopic.com%2F12%2F13%2F96%2F45bOOOPICe8_1024.jpg",@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1497954072210&di=23f6736d775f52c3edef3592cec9cf20&imgtype=0&src=http%3A%2F%2Fpic2.ooopic.com%2F12%2F13%2F96%2F45bOOOPICe8_1024.jpg",@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1497954072210&di=23f6736d775f52c3edef3592cec9cf20&imgtype=0&src=http%3A%2F%2Fpic2.ooopic.com%2F12%2F13%2F96%2F45bOOOPICe8_1024.jpg"];
////
//    
//    loopVC.images = @[[UIImage imageNamed:@"empty_banner.png"],[UIImage imageNamed:@"empty_banner.png"]];
    loopVC.currentIndex = 2;
    [self.navigationController pushViewController:loopVC animated:YES];
    
//    [self presentViewController:loopVC animated:YES completion:nil];
}
- (IBAction)browserClick:(id)sender {
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
