//
//  NSObject+ZWXSQLInsert.m
//  SQLMaker
//
//  Created by zhangwx on 2017/4/5.
//  Copyright © 2017年 zhangwx. All rights reserved.
//

#import "NSObject+ZWXSQLInsert.h"
#import <objc/runtime.h>

@implementation NSObject(ZWXSQLInsert)

- (NSArray<NSString *> *)insertIntoTable:(NSString *)tableName
{
    NSMutableString *retStr = [[NSMutableString alloc] init];
    [retStr appendFormat:@"insert into %@ (", tableName];
    
    unsigned int outCount = 0, i = 0;
    objc_property_t *properties = class_copyPropertyList(self.class, &outCount);
    
    for (i = 0; i < outCount; i++) {
        objc_property_t property = properties[i];
        NSString *propertyName = [NSString stringWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
        [retStr appendFormat:@"%@,",propertyName];
    }
    [retStr replaceCharactersInRange:NSMakeRange(retStr.length - 1, 1) withString:@""];
    [retStr appendString:@") values ("];
    
    for (NSString *key in keys) {
        id value = [item valueForKey:key];
        if ([value isKindOfClass:[NSString class]]) {
            [self.retStr appendString:[NSString stringWithFormat:@"'%@', ", value]];
        }else if ([value isKindOfClass:[NSNumber class]]){
            [self.retStr appendString:[NSString stringWithFormat:@"%@, ", value]];
        }
    }
}



@end
