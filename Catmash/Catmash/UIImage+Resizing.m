//
//  UIImage+Resizing.m
//  Catmash
//
//  Created by Steven Beck on 7/12/13.
//  Copyright (c) 2013 TheLGs. All rights reserved.
//

#import "UIImage+Resizing.h"

@implementation UIImage (Resizing)

- (UIImage *)imageScaledToSize:(CGSize)newSize {
    //UIGraphicsBeginImageContext(newSize);
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [self drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

@end
