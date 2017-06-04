//
//  NSArray+SyExtension.m
//  MacroObjc
//
//  Created by Sylvanas on 18/04/2017.
//  Copyright © 2017 Sylvanas. All rights reserved.
//

#import "NSArray+SyExtension.h"

@implementation NSArray (SyExtension)

- (NSString *)descriptionWithLocale:(id)locale {
    NSMutableString *str = [NSMutableString string];
    
    [str appendString:@"[\n"];
    
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [str appendFormat:@"%@,\n", obj];
    }];
    
    [str appendString:@"]"];
    
    NSRange range = [str rangeOfString:@"," options:NSBackwardsSearch];
    if (range.length != 0) {
        [str deleteCharactersInRange:range];
    }
    
    return str;
}

@end
