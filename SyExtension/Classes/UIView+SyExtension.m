//
//  UIView+Extension.m
//  ZiWeiDouShu
//
//  Created by EvilSylvanas on 8/10/16.
//  Copyright © 2016 apple. All rights reserved.
//

#import "UIView+SyExtension.h"

@implementation UIView (SyExtension)

- (CGFloat)sy_middleX {
    return self.sy_width * 0.5;
}

- (CGFloat)sy_middleY {
    return self.sy_height * 0.5;
}

- (CGPoint)sy_middle {
    return CGPointMake(self.sy_middleX, self.sy_middleY);
}

- (UIViewController *)viewController {
    for (UIView *view = self; view; view = view.superview) {
        UIResponder *nextResponder = [view nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}

- (UIImage *)sy_snapshotImage {
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.opaque, 0);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *snap = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return snap;
}

- (void)sy_setX:(CGFloat)sy_x {
    CGRect frame = self.frame;
    frame.origin.x = sy_x;
    self.frame = frame;

}

- (CGFloat)sy_x {
    return self.frame.origin.x;
}

- (void)sy_setY:(CGFloat)sy_y {
    CGRect frame = self.frame;
    frame.origin.y = sy_y;
    self.frame = frame;
}

- (CGFloat)sy_y {
    return self.frame.origin.y;
}

- (void)sy_setWidth:(CGFloat)sy_width {
    CGRect frame = self.frame;
    frame.size.width = sy_width;
    self.frame = frame;
}

- (CGFloat)sy_width {
    return self.frame.size.width;
}


- (void)sy_setHeight:(CGFloat)sy_height {
    CGRect frame = self.frame;
    frame.size.height = sy_height;
    self.frame = frame;
}

- (CGFloat)sy_height {
    return self.frame.size.height;
}

- (void)sy_setCenterX:(CGFloat)sy_centerX {
    CGPoint center = self.center;
    center.x = sy_centerX;
    self.center = center;
}

- (CGFloat)sy_centerX {
    return self.center.x;
}

- (void)sy_setCenterY:(CGFloat)sy_centerY {
    CGPoint center = self.center;
    center.y = sy_centerY;
    self.center = center;
}

- (CGFloat)sy_centerY {
    return self.center.y;
}

- (CGFloat)sy_maxX {
    return CGRectGetMaxX(self.frame);
}

- (void)sy_setMaxX:(CGFloat)sy_maxX {
    CGRect frame = self.frame;
    frame.origin.x = sy_maxX - self.sy_width;
    self.frame = frame;
}

- (CGFloat)sy_maxY {
    return CGRectGetMaxY(self.frame);
}

- (void)sy_setMaxY:(CGFloat)sy_maxY {
    CGRect frame = self.frame;
    frame.origin.y = sy_maxY - self.sy_height;
    self.frame = frame;
}

- (void)sy_setSize:(CGSize)sy_size {
    CGRect frame = self.frame;
    frame.size = sy_size;
    self.frame = frame;
}

- (CGSize)sy_size {
    return self.frame.size;
}

@end
