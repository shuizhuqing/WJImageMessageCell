//
//  IMPhotoBubbleImageViewLeft.h
//  IMAPPMIOS
//
//  Created by kfzx-sunwj on 16/2/24.
//  Copyright © 2016年 ICBC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IMPhotoBubbleImageViewLeft : UIImageView
{
    CALayer      *_contentLayer;
    CAShapeLayer *_maskLayer;
    
}
@property (strong, nonatomic) id paramengItem;

@end
