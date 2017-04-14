//
//  SQLMaker.m
//  SQLMaker
//
//  Created by zhangwx on 2017/2/23.
//  Copyright © 2017年 zhangwx. All rights reserved.
//

#import "ZWXSQLMaker.h"
#import <objc/runtime.h>

@interface SQLMaker ()
@property (nonatomic, strong) NSMutableString *retStr;
@end

@implementation SQLMaker

+(instancetype) shareInstance
{
    SQLMaker *instance = [[SQLMaker alloc] init];
    instance.retStr = [[NSMutableString alloc] init];
    return instance;
}

- (SQLNexter)select
{
    [self.retStr appendString:@"select "];
    return ^SQLMaker *(id item, ...){
        
        if (item) {
            va_list args;
            va_start(args, item);
            
            for (id currentObject = item; currentObject != nil; currentObject = va_arg(args, id)) {
                [self.retStr appendString:[NSString stringWithFormat:@"%@, ",currentObject]];
            }
            [self.retStr replaceCharactersInRange:NSMakeRange(self.retStr.length - 2, 1) withString:@""];
            va_end(args);
        }
        
        return self;
    };
}

- (SQLNexter)from
{
    [self.retStr appendString:@" from "];
    return ^SQLMaker *(id item, ...){
        
        if (item) {
            va_list args;
            va_start(args, item);
            
            for (id currentObject = item; currentObject != nil; currentObject = va_arg(args, id)) {
                [self.retStr appendString:[NSString stringWithFormat:@"%@, ",currentObject]];
            }
            [self.retStr replaceCharactersInRange:NSMakeRange(self.retStr.length - 2, 1) withString:@""];
            va_end(args);
        }
        
        return self;
    };
}

- (SQLNexter)where
{
    [self.retStr appendString:@" where "];
    return ^SQLMaker *(id item, ...){
        
        if (item) {
            va_list args;
            va_start(args, item);
            
            for (id currentObject = item; currentObject != nil; currentObject = va_arg(args, id)) {
                NSString *str = [currentObject stringByReplacingOccurrencesOfString:@"," withString:@" and "];
                [self.retStr appendString:[NSString stringWithFormat:@"%@ and ",str]];
            }
            [self.retStr replaceCharactersInRange:NSMakeRange(self.retStr.length - 4, 4) withString:@""];
            va_end(args);
        }
        
        return self;
    };
}

- (SQLNexter)groupby
{
    [self.retStr appendString:@" group by "];
    return ^SQLMaker *(id item, ...){
        
        if (item) {
            va_list args;
            va_start(args, item);
            
            for (id currentObject = item; currentObject != nil; currentObject = va_arg(args, id)) {
                [self.retStr appendString:[NSString stringWithFormat:@"%@, ",currentObject]];
            }
            [self.retStr replaceCharactersInRange:NSMakeRange(self.retStr.length - 2, 1) withString:@""];
            va_end(args);
        }
        
        return self;
    };
}

- (SQLNexter)orderby
{
    [self.retStr appendString:@" order by "];
    return ^SQLMaker *(id item, ...){
        
        if (item) {
            va_list args;
            va_start(args, item);
            
            for (id currentObject = item; currentObject != nil; currentObject = va_arg(args, id)) {
                [self.retStr appendString:[NSString stringWithFormat:@"%@, ",currentObject]];
            }
            [self.retStr replaceCharactersInRange:NSMakeRange(self.retStr.length - 2, 1) withString:@""];
            va_end(args);
        }
        
        return self;
    };
}

- (SQLNexter)update
{
    [self.retStr appendString:@"update "];
    return ^SQLMaker *(id item, ...){
        
        if (item) {
            va_list args;
            va_start(args, item);
            
            for (id currentObject = item; currentObject != nil; currentObject = va_arg(args, id)) {
                [self.retStr appendString:[NSString stringWithFormat:@"%@, ",currentObject]];
            }
            [self.retStr replaceCharactersInRange:NSMakeRange(self.retStr.length - 2, 1) withString:@""];
            va_end(args);
        }
        
        return self;
    };
}

- (SQLNexter)set
{
    [self.retStr appendString:@" set "];
    return ^SQLMaker *(id item, ...){
        
        if (item) {
            va_list args;
            va_start(args, item);
            
            for (id currentObject = item; currentObject != nil; currentObject = va_arg(args, id)) {
                [self.retStr appendString:[NSString stringWithFormat:@"%@, ",currentObject]];
            }
            [self.retStr replaceCharactersInRange:NSMakeRange(self.retStr.length - 2, 1) withString:@""];
            va_end(args);
        }
        
        return self;
    };
}

- (SQLNexter)insert
{
    [self.retStr appendString:@"insert into "];
    return ^SQLMaker *(id item, ...){
        
        if (item) {
            va_list args;
            va_start(args, item);
            
            for (id currentObject = item; currentObject != nil; currentObject = va_arg(args, id)) {
                [self.retStr appendString:[NSString stringWithFormat:@"%@, ",currentObject]];
            }
            [self.retStr replaceCharactersInRange:NSMakeRange(self.retStr.length - 2, 1) withString:@""];
            va_end(args);
        }
        
        return self;
    };
}

- (SQLNexter)value
{
    return ^SQLMaker *(id item, ...){
        
        if (item) {
            va_list args;
            va_start(args, item);
            
            [self.retStr appendString:@"("];
            
            NSMutableArray *keys = [[NSMutableArray alloc] init];
            NSMutableArray *values = [[NSMutableArray alloc] init];
            
            for (id currentObject = item; currentObject != nil; currentObject = va_arg(args, id)) {
                NSString *key = [currentObject componentsSeparatedByString:@"-"][0];
                NSString *value = [currentObject componentsSeparatedByString:@"-"][1];
                [keys addObject:key];
                [values addObject:value];
            }
            
            va_end(args);
            
            for (NSString *key in keys) {
                [self.retStr appendString:[NSString stringWithFormat:@"%@, ",key]];
            }
            [self.retStr replaceCharactersInRange:NSMakeRange(self.retStr.length - 2, 2) withString:@") values ("];
            
            for (NSString *value in values) {
                [self.retStr appendString:[NSString stringWithFormat:@"%@, ",value]];
            }
            [self.retStr replaceCharactersInRange:NSMakeRange(self.retStr.length - 2, 2) withString:@")"];
        }
        
        return self;
    };
}

- (SQLInsert)valueObj
{
    return ^SQLMaker *(id item){
        
        if (item) {
            
            [self.retStr appendString:@"("];
            NSMutableArray *keys = [[NSMutableArray alloc] init];
            
            unsigned int count;
            objc_property_t *props = class_copyPropertyList([item class], &count);
            for (int i = 0; i < count; i++) {
                objc_property_t prop = props[i];
                const char* name = property_getName(prop);
                NSString *nameStr = [NSString stringWithCString:name encoding:NSUTF8StringEncoding];
                [keys addObject:nameStr];
                [self.retStr appendString:[NSString stringWithFormat:@"%@, ", nameStr]];
            }
            [self.retStr replaceCharactersInRange:NSMakeRange(self.retStr.length - 2, 2) withString:@") values ("];
            
            for (NSString *key in keys) {
                id value = [item valueForKey:key];
                if ([value isKindOfClass:[NSString class]]) {
                    [self.retStr appendString:[NSString stringWithFormat:@"'%@', ", value]];
                }else if ([value isKindOfClass:[NSNumber class]]){
                    [self.retStr appendString:[NSString stringWithFormat:@"%@, ", value]];
                }else{
                    [self.retStr appendString:@"'', "];
                }
            }
            
            [self.retStr replaceCharactersInRange:NSMakeRange(self.retStr.length - 2, 2) withString:@")"];
            
        }
        
        return self;
    };
}

- (SQLNexter)deleteFrom
{
    [self.retStr appendString:@"delete from "];
    return ^SQLMaker *(id item, ...){
        
        if (item) {
            va_list args;
            va_start(args, item);
            
            for (id currentObject = item; currentObject != nil; currentObject = va_arg(args, id)) {
                [self.retStr appendString:[NSString stringWithFormat:@"%@, ",currentObject]];
            }
            [self.retStr replaceCharactersInRange:NSMakeRange(self.retStr.length - 2, 1) withString:@""];
            va_end(args);
        }
        
        return self;
    };
}

- (NSString *)toString
{
    NSString *str = [self.retStr stringByReplacingOccurrencesOfString:@"  " withString:@" "];
    str = [str stringByReplacingOccurrencesOfString:@" )" withString:@")"];
    str = [str stringByReplacingOccurrencesOfString:@"( " withString:@"("];
    if ([str hasSuffix:@" "]) {
        return [str substringToIndex:(str.length-1)];
    }
    return str;
}

@end

NSString * fun_count(NSString *item)
{
    return [NSString stringWithFormat:@"count(%@)", item];
}

NSString * fun_max(NSString *item)
{
    return [NSString stringWithFormat:@"max(%@)", item];
}

NSString * fun_namevalue(NSString *name, id value, NSString *relationship)
{
    return [NSString stringWithFormat:@"%@ %@ %@", name, relationship, value];
}

NSString * fun_nameexpress(NSString *name, NSString *eps, NSString *relationship)
{
    return [NSString stringWithFormat:@"%@ %@ (%@)", name, relationship, eps];
}

NSString * fun_getproptype(Class cls, char* prop)
{
    const char* attr = property_getAttributes(class_getProperty(cls, prop));
    NSString *propertyType = [[NSString stringWithCString:attr encoding:NSUTF8StringEncoding] lowercaseString];
    NSString *propertyClassName = @"'%@'";
    
    if ([propertyType hasPrefix:@"ti"] || [propertyType hasPrefix:@"tb"])
    {
        propertyClassName = @"%i";
    }
    else if ([propertyType hasPrefix:@"tf"])
    {
        propertyClassName = @"%f";
    }
    else if([propertyType hasPrefix:@"td"])
    {
        propertyClassName = @"%lf";
    }
    else if([propertyType hasPrefix:@"tl"] || [propertyType hasPrefix:@"tq"])
    {
        propertyClassName = @"%ld";
    }
    else if ([propertyType hasPrefix:@"tc"])
    {
        propertyClassName = @"%c";
    }
    else if([propertyType hasPrefix:@"ts"])
    {
        propertyClassName = @"%s";
    }
    
    return propertyClassName;
}
