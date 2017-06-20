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
    loopVC.images = @[@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1497954027405&di=07ca7dfc2b94e48eb5ad304c1cb881a1&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimgad%2Fpic%2Fitem%2F5fdf8db1cb1349547059c0755c4e9258d1094a5f.jpg",@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1497954027405&di=cd3fd9463065d9b575fba59df7302781&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimgad%2Fpic%2Fitem%2Fa9d3fd1f4134970ac9e997009fcad1c8a7865d03.jpg",@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1497954027405&di=3cb62e6a21ce1242b68d87abc49cc4ec&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimgad%2Fpic%2Fitem%2Fd000baa1cd11728b0983d70cc2fcc3cec3fd2c75.jpg",@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1497954072210&di=23f6736d775f52c3edef3592cec9cf20&imgtype=0&src=http%3A%2F%2Fpic2.ooopic.com%2F12%2F13%2F96%2F45bOOOPICe8_1024.jpg"];
////
//    
//    loopVC.images = @[[UIImage imageNamed:@"empty_banner.png"],[UIImage imageNamed:@"empty_banner.png"]];
    loopVC.currentIndex = 0;
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
