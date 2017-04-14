//
//  SQLMaker.h
//  SQLMaker
//
//  Created by zhangwx on 2017/2/23.
//  Copyright © 2017年 zhangwx. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SQLMaker;

typedef SQLMaker*(^SQLNexter)(id item, ...);
typedef SQLMaker*(^SQLInsert)(id item);

@interface SQLMaker : NSObject

@property (nonatomic, weak, readonly) SQLNexter select;
@property (nonatomic, weak, readonly) SQLNexter from;
@property (nonatomic, weak, readonly) SQLNexter where;
@property (nonatomic, weak, readonly) SQLNexter groupby;
@property (nonatomic, weak, readonly) SQLNexter orderby;

@property (nonatomic, weak, readonly) SQLNexter update;
@property (nonatomic, weak, readonly) SQLNexter set;

@property (nonatomic, weak, readonly) SQLNexter insert;
@property (nonatomic, weak, readonly) SQLNexter value;
@property (nonatomic, weak, readonly) SQLInsert valueObj;

@property (nonatomic, weak, readonly) SQLNexter deleteFrom;

@property (nonatomic, weak, readonly) NSString *toString;

+(instancetype) shareInstance;

@end

NSString * fun_count(NSString *item);
NSString * fun_max(NSString *item);
NSString * fun_namevalue(NSString *name, id value, NSString *relationship);
NSString * fun_nameexpress(NSString *name, NSString *eps, NSString *relationship);

NSString * fun_getproptype(Class cls, char* prop);

