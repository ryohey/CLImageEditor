//
//  UIImage+Margin.m
//  CLImageEditorDemo
//
//  Created by ryohey on 2017/11/15.
//  Copyright © 2017年 CALACULU. All rights reserved.
//

#import "UIImage+Margin.h"

@implementation UIImage (AddMargin)

// https://stackoverflow.com/a/20021989/1567777
- (UIImage *)imageWithAppendingMargin:(CGFloat)marginRatio {
    CGFloat width = self.size.width * marginRatio;
    CGFloat height = self.size.height * marginRatio;
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(width, height), NO, 0.0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    UIGraphicsPushContext(context);

    CGPoint origin = CGPointMake((width - self.size.width) / 2.0f,
                                 (height - self.size.height) / 2.0f);
    [self drawAtPoint:origin];

    UIGraphicsPopContext();
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return newImage;
}

@end
