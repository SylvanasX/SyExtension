//
//  NSDictionary+SyExtension.m
//  MacroObjc
//
//  Created by Sylvanas on 18/04/2017.
//  Copyright © 2017 Sylvanas. All rights reserved.
//

#import "NSDictionary+SyExtension.h"

@implementation NSDictionary (SyExtension)

- (NSString *)descriptionWithLocale:(id)locale {
    NSMutableString *str = [NSMutableString string];
    
    [str appendString:@"{\n"];
    
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [str appendFormat:@"\t%@ = %@,\n", key, obj];
    }];
    
    [str appendString:@"}"];
    
    NSRange range = [str rangeOfString:@"," options:NSBackwardsSearch];
    if (range.length != 0) {
        [str deleteCharactersInRange:range];
    }
    
    return str;
}

@end
