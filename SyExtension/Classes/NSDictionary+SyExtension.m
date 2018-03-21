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

- (NSString *)jsonStringWithPrettyPrint:(BOOL)prettyPrint {
    NSError *error;
    if (self) {
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self
                                                           options:(NSJSONWritingOptions) (prettyPrint ? NSJSONWritingPrettyPrinted : 0)
                                                             error:&error];
        
        if (! jsonData) {
            NSLog(@"jsonStringWithPrettyPrint: error: %@", error.localizedDescription);
            return @"{}";
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
