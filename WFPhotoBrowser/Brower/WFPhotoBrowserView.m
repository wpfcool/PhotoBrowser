//
//  WFPhotoBrowserView.m
//  WFPhotoBrowser
//
//  Created by wenpeifang on 2017/6/20.
//  Copyright © 2017年 wenpeifang. All rights reserved.
//

#import "WFPhotoBrowserView.h"
#import "WFPhotoView.h"
#import "UIImageView+WebCache.h"

@interface WFPhotoBrowserView()<UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) WFPhotoView *imageView1;
@property (nonatomic, strong) WFPhotoView *imageView2;
@property (nonatomic, strong) WFPhotoView *imageView3;


@property (nonatomic, strong) UIView * topView;
@property (nonatomic, strong) UILabel * textLabel;
@end

@implementation WFPhotoBrowserView

-(instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        [self initUI];
    }
    return self;
}


-(void)awakeFromNib{
    [super awakeFromNib];
    [self initUI];

}

-(void)initUI{
    _currentPage = 0;
    _padding = 10;
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    _scrollView.backgroundColor =[UIColor blackColor];
    _scrollView.delegate = self;
    _scrollView.pagingEnabled = YES;
    _scrollView.bounces = NO;
    _scrollView.scrollsToTop = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
    [self addSubview:_scrollView];

    
//    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 0, 120, 12)];
//    _pageControl.center = CGPointMake(CGRectGetMinX(self.bounds),
//                                      CGRectGetMaxY(self.bounds) - 5);
//    _pageControl.autoresizingMask = (UIViewAutoresizingFlexibleTopMargin |
//                                     UIViewAutoresizingFlexibleLeftMargin |
//                                     UIViewAutoresizingFlexibleRightMargin);
//    [self addSubview:_pageControl];
//    
    _imageView1 = [[WFPhotoView alloc] initWithFrame:CGRectZero];
    _imageView2 = [[WFPhotoView alloc] initWithFrame:CGRectZero];
    _imageView3 = [[WFPhotoView alloc] initWithFrame:CGRectZero];

    [_scrollView addSubview:_imageView1];
    [_scrollView addSubview:_imageView2];
    [_scrollView addSubview:_imageView3];
    
    
    
    _topView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 64)];
    _topView.backgroundColor = [UIColor blackColor];
    [self addSubview:_topView];
    
    UIButton * backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setImage:[UIImage imageNamed:@"navigation_back.png"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backClick:) forControlEvents:UIControlEventTouchUpInside];
    backButton.frame = CGRectMake(0, 20, 40, 44);
    [_topView addSubview:backButton];
    
    
    _textLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 20,  _topView.bounds.size.width, 44)];
    _textLabel.textAlignment = NSTextAlignmentCenter;
    _textLabel.textColor= [UIColor whiteColor];
    _textLabel.font = [UIFont systemFontOfSize:15];
//    _textLabel.text = @"1/4";
    _textLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [_topView addSubview:_textLabel];
    
    
    UITapGestureRecognizer *_tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    [self addGestureRecognizer:_tapGesture];
    
    UITapGestureRecognizer * doubleGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTap:)];
    doubleGesture.numberOfTapsRequired = 2;
    [self addGestureRecognizer:doubleGesture];
    [_tapGesture requireGestureRecognizerToFail:doubleGesture];
}
- (void)layoutSubviews {
    [super layoutSubviews];
    CGRect rect = self.bounds;
    rect.size.width += _padding;
    
    _scrollView.frame = rect;
    _imageView1.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
    _imageView2.frame = CGRectMake(_padding + self.bounds.size.width, 0 ,self.bounds.size.width, self.bounds.size.height);
    _imageView3.frame = CGRectMake((self.bounds.size.width + _padding)*2,0, self.bounds.size.width, self.bounds.size.height);
    _scrollView.contentSize = CGSizeMake((self.bounds.size.width+_padding) * 3, self.bounds.size.height);
    _scrollView.contentOffset = CGPointMake(_scrollView.bounds.size.width, 0);
    _scrollView.contentInset = UIEdgeInsetsMake(0, 0, 0, _padding);
    _topView.frame = CGRectMake(0, 0, self.bounds.size.width, 64);
}

- (void)repositionSubviews {
//    _pageControl.currentPage = _currentPage;
    
    NSInteger page1 = [self adjustPageNum:_currentPage - 1];
    NSInteger page2 = _currentPage;
    NSInteger page3 = [self adjustPageNum:_currentPage + 1];
    
    [self loadImageAtIndex:page1 inImageView:_imageView1];
    [self loadImageAtIndex:page2 inImageView:_imageView2];
    [self loadImageAtIndex:page3 inImageView:_imageView3];
    
    [_scrollView setContentOffset:CGPointMake(_scrollView.bounds.size.width, 0) animated:NO];
}

- (void)loadImageAtIndex:(NSUInteger)index inImageView:(WFPhotoView *)photoView {
    if(index < _arrayOfImages.count){
        [photoView resetSize];
        id obj = _arrayOfImages[index];
        if([obj isKindOfClass:[UIImage class]]){
            photoView.imageView.image = obj;
        }else if([obj isKindOfClass:[NSString class]]){
            [photoView startLoading];
            [photoView.imageView sd_setImageWithURL:[NSURL URLWithString:obj] placeholderImage:[UIImage imageNamed:_placeholderImage] options:SDWebImageAllowInvalidSSLCertificates progress:^(NSInteger receivedSize, NSInteger expectedSize) {
                
            } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                [photoView stopLoading];
                [photoView.imageView setContentMode:UIViewContentModeScaleAspectFit];
                NSLog(@"%@",error);
                
            }];
        }
        
        
    }
}
- (NSInteger)adjustPageNum:(NSInteger)pageNum {
    if (pageNum < 0) {
        pageNum += _arrayOfImages.count;
    } else {
        pageNum %= _arrayOfImages.count;
    }
    return pageNum;
}
-(void)setCurrentPage:(NSInteger)currentPage{
    _currentPage = [self adjustPageNum:currentPage];
    [self repositionSubviews];
    
    _textLabel.text = [NSString stringWithFormat:@"%@/%@",@(_currentPage + 1),@(self.arrayOfImages.count)];
}
-(void)setArrayOfImages:(NSArray *)arrayOfImages{
    _arrayOfImages = arrayOfImages;
    if(arrayOfImages.count == 1){
        _scrollView.scrollEnabled = NO;
    }
//    _pageControl.numberOfPages = _arrayOfImages.count;

    [self repositionSubviews];
}

- (void)recalcCurrentPage {
    if (_scrollView.contentOffset.x == 0) {
        self.currentPage--;
    } else if (_scrollView.contentOffset.x > _scrollView.bounds.size.width) {
        self.currentPage++;
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView
                  willDecelerate:(BOOL)decelerate {
    if (!decelerate) {
        [self recalcCurrentPage];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [self recalcCurrentPage];
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    [self recalcCurrentPage];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
}


-(void)handleTap:(UITapGestureRecognizer *)tap{
    
    NSLog(@"%lu",(unsigned long)tap.numberOfTapsRequired);
    if(tap.numberOfTapsRequired == 1){
        //单击
        self.topView.hidden = !self.topView.isHidden;
        if(_delegate && [_delegate respondsToSelector:@selector(userDidTapImageAtIndex:)]){
            [_delegate userDidTapImageAtIndex:_currentPage];
        }
    }else if(tap.numberOfTapsRequired == 2){
        //双击
        [UIView animateWithDuration:0.3 animations:^{
            [_imageView1 resetSize];
            [_imageView2 resetSize];
            [_imageView3 resetSize];
        }];

       
    }
}

-(void)backClick:(id)sender{
    [_delegate userDidTapClose];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
