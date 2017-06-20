//
//  WFPhotoView.m
//  WFPhotoBrowser
//
//  Created by wenpeifang on 2017/6/20.
//  Copyright © 2017年 wenpeifang. All rights reserved.
//

#import "WFPhotoView.h"
@interface WFPhotoView ()<UIScrollViewDelegate,UIGestureRecognizerDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, assign) CGFloat firstX;
@property (nonatomic, assign) CGFloat firstY;
@property (nonatomic, strong) UIActivityIndicatorView * activityView;

@end
@implementation WFPhotoView
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        _scrollView.backgroundColor = [UIColor blackColor];
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.delegate = self;
        _scrollView.maximumZoomScale = 3;
        _scrollView.minimumZoomScale = 1;
        _scrollView.contentSize = self.imageView.image.size;
        [self addSubview:_scrollView];
        [self.scrollView addSubview:self.imageView];
        self.scrollView.userInteractionEnabled = YES;
        self.scrollView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
        
        _activityView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        _activityView.hidesWhenStopped = YES;
        _activityView.frame = CGRectMake(0, 0, 100, 100);
        [self addSubview:_activityView];
        
    }
    return self;
}
- (UIImageView *)imageView {
    if (_imageView==nil) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 284 * self.bounds.size.height / 320)];
        _imageView.center = self.scrollView.center;
        [_imageView setContentMode:UIViewContentModeScaleAspectFit];
        _imageView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    }
    return _imageView;
}
-(void)startLoading{
    [_activityView startAnimating];
}
-(void)stopLoading{
    [_activityView stopAnimating];

}
-(void)layoutSubviews
{
    [super layoutSubviews];
    _scrollView.frame = self.bounds;
    _imageView.frame =CGRectMake(0, 0, self.bounds.size.width, 284 * self.bounds.size.height / 320);
    _imageView.center = self.scrollView.center;
    _activityView.frame = CGRectMake((self.bounds.size.width -100)/2.0, (self.bounds.size.height -100)/2.0, 100, 100);
}

- (void)resetSize {
    [self.scrollView setZoomScale:1.0];
}
#pragma mark - UIScrollViewDelegate

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.imageView;
}

-(void)scrollViewDidZoom:(UIScrollView *)scrollView {
    CGFloat offsetX = (scrollView.bounds.size.width > scrollView.contentSize.width)?
    (scrollView.bounds.size.width - scrollView.contentSize.width) * 0.5 : 0.0;
    CGFloat offsetY = (scrollView.bounds.size.height > scrollView.contentSize.height)?
    (scrollView.bounds.size.height - scrollView.contentSize.height) * 0.5 : 0.0;
    self.imageView.center = CGPointMake(scrollView.contentSize.width * 0.5 + offsetX,
                                            scrollView.contentSize.height * 0.5 + offsetY);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
