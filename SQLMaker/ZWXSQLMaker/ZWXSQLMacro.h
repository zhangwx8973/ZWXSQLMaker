//
//  ZWXSQLMacro.h
//  SQLMaker
//
//  Created by zhangwx on 2017/3/12.
//  Copyright © 2017年 zhangwx. All rights reserved.
//

#import "ZWXSQLMaker.h"

#define select(...) [SQLMaker shareInstance].select(__VA_ARGS__ , nil)
#define count(x) fun_count(x)
#define max(x) fun_max(x)
#define from(...) from(__VA_ARGS__ , nil)
#define where(...) where(__VA_ARGS__ , nil)
#define groupby(...) groupby(__VA_ARGS__ , nil)
#define orderby(...) orderby(__VA_ARGS__ , nil)
#define ASC(x) [NSString stringWithFormat:@"%@ ASC", x]
#define DESC(x) [NSString stringWithFormat:@"%@ DESC", x]

#define update(...) [SQLMaker shareInstance].update(__VA_ARGS__ , nil)
#define set(...) set(__VA_ARGS__ , nil)

#define insertinto(x) [SQLMaker shareInstance].insert(x, nil)
#define byprop(...) value(__VA_ARGS__ , nil)
#define byobjc(x) valueObj(x)

#define deleteFrom(x) [SQLMaker shareInstance].deleteFrom(x,nil)


#define PROPNAME(x) @keypath(x)

#define PROPNAME_EQUAL_VALUE(x,y) fun_namevalue(@#y, (id)keypath2(x,y,fun_getproptype(x.class, #y)), @"=")
#define PROPNAME_NOTEQUAL_VALUE(x,y) fun_namevalue(@#y, (id)keypath2(x,y,fun_getproptype(x.class, #y)), @"<>")
#define PROPNAME_BIGGERTHAN_VALUE(x,y) fun_namevalue(@#y, (id)keypath2(x,y,fun_getproptype(x.class, #y)), @">")

#define PROPNAME_SMALLERTHAN_VALUE(x,y) fun_namevalue(@#y, (id)keypath2(x,y,fun_getproptype(x.class, #y)), @"<")

#define PROPNAME_VALUE(x,y) fun_namevalue(@#y, (id)keypath2(x,y,fun_getproptype(x.class, #y)), @"-")

#define PROPNAME_EQUAL_EPS(x,y) fun_nameexpress(@keypath(x), y, @"=")
#define PROPNAME_NOTEQUAL_EPS(x,y) fun_nameexpress(@keypath(x), y, @"<>")
#define PROPNAME_BIGGERTHAN_EPS(x,y) fun_nameexpress(@keypath(x), y, @">")
#define PROPNAME_SMALLERTHAN_EPS(x,y) fun_nameexpress(@keypath(x), y, @"<")
#define PROPNAME_IN_EPS(x,y) fun_nameexpress(@keypath(x), y, @"in")

#define CLASSNAME(x) NSStringFromClass([x class])


#define keypath(PATH) \
(((void)(NO && ((void)PATH, NO)), strchr(# PATH, '.') + 1))

#define keypath2(PATH,OBJ,FMT) \
(((void)(NO && ((void)PATH.OBJ, NO)), [NSString stringWithFormat:FMT,PATH.OBJ]))
