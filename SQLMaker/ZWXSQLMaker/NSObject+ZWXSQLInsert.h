//
//  NSObject+ZWXSQLInsert.h
//  SQLMaker
//
//  Created by zhangwx on 2017/4/5.
//  Copyright © 2017年 zhangwx. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ZWXSQLObj <NSObject>

- (NSString *)tableName;
- (BOOL)needSuperClassProps;

@end

@interface NSObject (ZWXSQLInsert)

- (NSArray<NSString *> *)insertIntoTableSQLs:(NSString *)tableName;

@end
