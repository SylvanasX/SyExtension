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

- (NSString *)jsonStringWithPrettyPrint:(BOOL)prettyPrint {
    NSError *error;
    if (self) {
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self
                                                           options:(NSJSONWritingOptions) (prettyPrint ? NSJSONWritingPrettyPrinted : 0)
                                                             error:&error];
        
        if (! jsonData) {
            NSLog(@"jsonStringWithPrettyPrint: error: %@", error.localizedDescription);
            return @"[]";
        } else {
            return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        }
    } else {
        return nil;
    }
}

- (NSString *)toString {
    return [self jsonStringWithPrettyPrint:YES];
}

@end
