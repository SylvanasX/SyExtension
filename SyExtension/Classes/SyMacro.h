//
//  SyMacro.h
//  MarcoObjc
//
//  Created by Sylvanas on 02/11/2016.
//  Copyright © 2016 Sylvanas. All rights reserved.
//

#import <pthread.h>

#ifndef SyMacro_h
#define SyMacro_h

#ifndef weakify
    #if DEBUG
        #if __has_feature(objc_arc)
        #define weakify(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
        #else
        #define weakify(object) autoreleasepool{} __block __typeof__(object) block##_##object = object;
        #endif
    #else
        #if __has_feature(objc_arc)
        #define weakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
        #else
        #define weakify(object) try{} @finally{} {} __block __typeof__(object) block##_##object = object;
        #endif
    #endif
#endif

#ifndef strongify
    #if DEBUG
        #if __has_feature(objc_arc)
        #define strongify(object) autoreleasepool{} __typeof__(object) object = weak##_##object;
        #else
        #define strongify(object) autoreleasepool{} __typeof__(object) object = block##_##object;
        #endif
    #else
        #if __has_feature(objc_arc)
        #define strongify(object) try{} @finally{} __typeof__(object) object = weak##_##object;
        #else
        #define strongify(object) try{} @finally{} __typeof__(object) object = block##_##object;
        #endif
    #endif
#endif

#ifdef DEBUG
#define DebugLog(format, ...) NSLog((@"func :%s [line :%d] " format), __func__, __LINE__, ##__VA_ARGS__);
#else
#define DebugLog(...);
#endif

static inline bool dispatch_is_main_queue() {
    return pthread_main_np() != 0;
}

static inline void dispatch_async_on_global_queue(dispatch_block_t block) {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        !block ?: block();
    });
}

static inline void dispatch_async_on_main_queue(dispatch_block_t block) {
    if (pthread_main_np()) {
        !block ?: block();
    } else {
        if (block) {
            dispatch_async(dispatch_get_main_queue(), block);
        }
    }
}

static inline void dispatch_sync_on_main_queue(dispatch_block_t block) {
    if (pthread_main_np()) {
        !block ?: block();
    } else {
        if (block) {
            dispatch_sync(dispatch_get_main_queue(), block);
        }
    }
}

#endif /* SyMacro_h */
