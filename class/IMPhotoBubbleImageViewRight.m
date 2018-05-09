//
//  IMPhotoBubbleImageViewRight.m
//  IMAPPMIOS
//
//  Created by kfzx-sunwj on 16/2/24.
//  Copyright © 2016年 ICBC. All rights reserved.
//

#import "IMPhotoBubbleImageViewRight.h"

@implementation IMPhotoBubbleImageViewRight

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
        CGPathMoveToPoint(path, NULL, origin.x, height*0.5);//左线 中间点
        CGPathMoveToPoint(path, NULL, origin.x, origin.y + radius);//左线 顶部点
        CGPathAddArcToPoint(path, NULL, origin.x, origin.y, origin.x + radius, origin.y, radius);
        //        CGPathMoveToPoint(path, NULL, width - marginWidth - radius, origin.y);
        CGPathAddArcToPoint(path, NULL, width - marginWidth, origin.y, width - marginWidth, origin.y + radius, radius);
        CGPathAddLineToPoint(path, NULL, width - marginWidth, origin.y+marginHeight);
        CGPathAddLineToPoint(path, NULL, width, origin.y+marginHeight+margin3Heig*0.5);
        CGPathAddLineToPoint(path, NULL, width - marginWidth, origin.y+marginHeight+margin3Heig);
        CGPathAddLineToPoint(path, NULL, width - marginWidth, height - radius);
        CGPathAddArcToPoint(path, NULL, width - marginWidth, height, width - marginWidth - radius, height, radius);
        //        CGPathMoveToPoint(path, NULL, origin.x+radius, height);
        CGPathAddArcToPoint(path, NULL, origin.x, height, origin.x, height - radius, radius);
        CGPathAddLineToPoint(path, NULL, origin.x, height*0.5);
       
    
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
