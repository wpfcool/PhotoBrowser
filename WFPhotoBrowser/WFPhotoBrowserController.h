//
//  WFPhotoBrowserController.h
//  WFPhotoBrowser
//
//  Created by wenpeifang on 2017/6/20.
//  Copyright © 2017年 wenpeifang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WFPhotoBrowserController : UIViewController
@property (nonatomic,copy)NSString * placeholderImage;
@property (nonatomic,strong) NSArray * images;
@property (nonatomic,assign)NSInteger currentIndex;
@end
