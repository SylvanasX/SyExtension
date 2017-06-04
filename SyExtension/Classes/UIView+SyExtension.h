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

@property (nonatomic, assign) CGFloat sy_x;
@property (nonatomic, assign) CGFloat sy_y;
@property (nonatomic, assign) CGFloat sy_width;
@property (nonatomic, assign) CGFloat sy_height;
@property (nonatomic, assign) CGFloat sy_centerX;
@property (nonatomic, assign) CGFloat sy_centerY;
@property (nonatomic, assign) CGFloat sy_maxX;
@property (nonatomic, assign) CGFloat sy_maxY;
@property (nonatomic, assign) CGSize sy_size;

@property (nonatomic, assign, readonly) CGFloat sy_middleX;
@property (nonatomic, assign, readonly) CGFloat sy_middleY;
@property (nonatomic, assign, readonly) CGPoint sy_middle;

@property (nonatomic, strong, nullable, readonly) UIViewController *viewController;

- (nullable UIImage *)sy_snapshotImage;

@end

NS_ASSUME_NONNULL_END
