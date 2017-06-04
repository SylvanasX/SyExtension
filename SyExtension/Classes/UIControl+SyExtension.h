//
//  UIControl+SyExtension.h
//  MacroObjc
//
//  Created by Sylvanas on 24/05/2017.
//  Copyright © 2017 Sylvanas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIControl (SyExtension)

- (void)removeAllTargets;

- (void)setTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents;

- (void)addBlockForControlEvents:(UIControlEvents)controlEvents block:(void (^)(id sender))block;

- (void)setBlockForControlEvents:(UIControlEvents)controlEvents block:(void (^)(id sender))block;

- (void)removeAllBlocksForControlEvents:(UIControlEvents)controlEvents;

@end
