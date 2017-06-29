//
//  WFPhotoBrowserView.h
//  WFPhotoBrowser
//
//  Created by wenpeifang on 2017/6/20.
//  Copyright © 2017年 wenpeifang. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol WFPhotoBrowserViewDelegate;
@interface WFPhotoBrowserView : UIView
@property (nonatomic, strong) NSArray *arrayOfImages;
@property (nonatomic,copy)NSString * placeholderImage; //默认图片
@property (nonatomic,weak) id<WFPhotoBrowserViewDelegate>delegate;
//@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, assign) NSInteger currentPage;


@property (nonatomic,assign)CGFloat padding;

@end


@protocol WFPhotoBrowserViewDelegate <NSObject>
@optional
- (void)userDidTapImageAtIndex:(NSUInteger)index;
@required
- (void)userDidTapClose;
@end
