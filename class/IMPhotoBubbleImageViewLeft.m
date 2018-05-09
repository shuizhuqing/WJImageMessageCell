//
//  IMPhotoBubbleImageViewLeft.m
//  IMAPPMIOS
//
//  Created by kfzx-sunwj on 16/2/24.
//  Copyright © 2016年 ICBC. All rights reserved.
//

#import "IMPhotoBubbleImageViewLeft.h"

@implementation IMPhotoBubbleImageViewLeft

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup:frame];
    }
    return self;
}
- (void)setup:(CGRect)frame
{
    CGFloat width = frame.size.width;
    CGFloat height = frame.size.height;
    CGFloat marginHeight = 16;
    CGFloat marginWidth = 6;
    CGFloat margin3Heig = 8;
    CGFloat radius = 5;
    CGMutablePathRef path = CGPathCreateMutable();
        CGPoint origin = self.bounds.origin;
        CGPathMoveToPoint(path, NULL, width, height*0.5);//右线 中间点
        CGPathMoveToPoint(path, NULL, width, height - radius);//左线 顶部点
        CGPathAddArcToPoint(path, NULL, width, height, width - radius, height, radius);
        //        CGPathMoveToPoint(path, NULL, width - marginWidth - radius, origin.y);
        CGPathAddArcToPoint(path, NULL, marginWidth, height, marginWidth, height - radius, radius);
        CGPathAddLineToPoint(path, NULL, marginWidth, origin.y+marginHeight+margin3Heig);
        CGPathAddLineToPoint(path, NULL, origin.x, origin.y+marginHeight+margin3Heig*0.5);
        CGPathAddLineToPoint(path, NULL, marginWidth, origin.y+marginHeight);
        CGPathAddLineToPoint(path, NULL, marginWidth, radius);
        CGPathAddArcToPoint(path, NULL, origin.x+marginWidth,  origin.y, origin.x + marginWidth + radius, origin.y, radius);
        //        CGPathMoveToPoint(path, NULL, origin.x+radius, height);
        CGPathAddArcToPoint(path, NULL, width, origin.y, width, origin.y+radius, radius);
        CGPathAddLineToPoint(path, NULL, width, height*0.5);
    
    
    _maskLayer = [CAShapeLayer layer];
    _maskLayer.path = path;//[UIBezierPath bezierPathWithOvalInRect:self.bounds].CGPath;
    _maskLayer.fillColor = [UIColor blackColor].CGColor;
    _maskLayer.strokeColor = [UIColor redColor].CGColor;
    _maskLayer.frame = self.bounds;
    _maskLayer.contentsCenter = CGRectMake(0.5, 0.5, 0.1, 0.1);
    _maskLayer.contentsScale = [UIScreen mainScreen].scale;
    
    _contentLayer = [CALayer layer];
    _contentLayer.mask = _maskLayer;
    _contentLayer.frame = self.bounds;
    [self.layer addSublayer:_contentLayer];
    
}

- (void)setImage:(UIImage *)image
{
    _contentLayer.contents = (id)image.CGImage;
}

@end
