//
//  ClassNameMacro.h
//  SQLMaker
//
//  Created by zhangwx on 2017/2/25.
//  Copyright © 2017年 zhangwx. All rights reserved.
//


#define CLASSNAME(arg)  (([@#arg rangeOfString:@"\""].location == NSNotFound) ? CLASSNAME2(arg) : CLASSNAME1(arg))
#define CLASSNAME1(arg) @#arg
#define CLASSNAME2(arg) NSStringFromClass([arg class])

#define CLASSNAME_1(field) CLASSNAME(field)\

#define CLASSNAME_2(field, ...)\
[NSString stringWithFormat:@"%@ , %@", CLASSNAME(field), CLASSNAME_1(__VA_ARGS__)]\

#define CLASSNAME_3(field, ...)\
[NSString stringWithFormat:@"%@ , %@", CLASSNAME(field), CLASSNAME_2(__VA_ARGS__)]\

#define CLASSNAME_4(field, ...)\
[NSString stringWithFormat:@"%@ , %@", CLASSNAME(field), CLASSNAME_3(__VA_ARGS__)]\

#define CLASSNAME_5(field, ...)\
[NSString stringWithFormat:@"%@ , %@", CLASSNAME(field), CLASSNAME_4(__VA_ARGS__)]\

#define CLASSNAME_6(field, ...)\
[NSString stringWithFormat:@"%@ , %@", CLASSNAME(field), CLASSNAME_5(__VA_ARGS__)]\

#define CLASSNAME_7(field, ...)\
[NSString stringWithFormat:@"%@ , %@", CLASSNAME(field), CLASSNAME_6(__VA_ARGS__)]\

#define CLASSNAME_8(field, ...)\
[NSString stringWithFormat:@"%@ , %@", CLASSNAME(field), CLASSNAME_7(__VA_ARGS__)]\

#define CLASSNAME_(N, ...) CONCATENATE(CLASSNAME_, N)( __VA_ARGS__)

#define GET_CLASSNAME(...) CLASSNAME_(PP_NARG( __VA_ARGS__),  __VA_ARGS__)
