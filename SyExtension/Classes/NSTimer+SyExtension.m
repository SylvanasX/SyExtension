//
//  NSTimer+SyExtension.m
//  MacroObjc
//
//  Created by Sylvanas on 03/02/2017.
//  Copyright © 2017 Sylvanas. All rights reserved.
//

#import "NSTimer+SyExtension.h"

@implementation NSTimer (SyExtension)

+ (NSTimer *)sy_scheduledTimerWithTimeInterval:(NSTimeInterval)seconds block:(void (^)(NSTimer * _Nonnull))block repeats:(BOOL)repeats {
    return [NSTimer scheduledTimerWithTimeInterval:seconds target:self selector:@selector(_sy_ExecBlock:) userInfo:[block copy] repeats:repeats];
}

+ (NSTimer *)sy_timerWithTimeInterval:(NSTimeInterval)seconds block:(void (^)(NSTimer * _Nonnull))block repeats:(BOOL)repeats {
    return [NSTimer timerWithTimeInterval:seconds target:self selector:@selector(_sy_ExecBlock:) userInfo:[block copy] repeats:repeats];
}

#pragma mark - Private

+ (void)_sy_ExecBlock:(NSTimer *)timer {
    if ([timer userInfo]) {
        void (^block)(NSTimer *timer) = (void (^)(NSTimer *timer))[timer userInfo];
        block(timer);
    }
}

@end
