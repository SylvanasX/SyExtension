//
//  NSArray+SyExtension.h
//  MacroObjc
//
//  Created by Sylvanas on 18/04/2017.
//  Copyright © 2017 Sylvanas. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (SyExtension)

@property (nonatomic, copy, readonly) NSString *toString;
- (NSString *)jsonStringWithPrettyPrint:(BOOL)prettyPrint;

@end
