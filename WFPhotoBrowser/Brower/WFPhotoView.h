//
//  WFPhotoView.h
//  WFPhotoBrowser
//
//  Created by wenpeifang on 2017/6/20.
//  Copyright © 2017年 wenpeifang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WFPhotoView : UIView

@property(nonatomic, strong) UIImageView *imageView;
-(void)startLoading;
-(void)stopLoading;
- (void)resetSize;
- (void)resizeImageView;

@end
