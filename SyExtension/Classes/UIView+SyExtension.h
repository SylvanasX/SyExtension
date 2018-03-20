//
//  UIView+Extension.h
//  ZiWeiDouShu
//
//  Created by EvilSylvanas on 8/10/16.
//  Copyright © 2016 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (SyExtension)

@property (nonatomic, assign, setter = sy_setX:) CGFloat sy_x;
@property (nonatomic, assign, setter = sy_setY:) CGFloat sy_y;
@property (nonatomic, assign, setter = sy_setWidth:) CGFloat sy_width;
@property (nonatomic, assign, setter = sy_setHeight:) CGFloat sy_height;
@property (nonatomic, assign, setter = sy_setCenterX:) CGFloat sy_centerX;
@property (nonatomic, assign, setter = sy_setCenterY:) CGFloat sy_centerY;
@property (nonatomic, assign, setter = sy_setMaxX:) CGFloat sy_maxX;
@property (nonatomic, assign, setter = sy_setMaxY:) CGFloat sy_maxY;
@property (nonatomic, assign, setter = sy_setSize:) CGSize sy_size;

@property (nonatomic, assign, readonly) CGFloat sy_middleX;
@property (nonatomic, assign, readonly) CGFloat sy_middleY;
@property (nonatomic, assign, readonly) CGPoint sy_middle;

@property (nonatomic, strong, nullable, readonly) UIViewController *viewController;

- (nullable UIImage *)sy_snapshotImage;

@end

NS_ASSUME_NONNULL_END
