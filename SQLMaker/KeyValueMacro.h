//
//  KeyValueMacro.h
//  SQLMaker
//
//  Created by zhangwx on 2017/2/25.
//  Copyright © 2017年 zhangwx. All rights reserved.
//


#import "KeyMacroTool.h"

#define STRINGIZE(arg)  (([@#arg rangeOfString:@"\""].location == NSNotFound) ? STRINGIZE2(arg) : STRINGIZE1(arg))
#define STRINGIZE1(arg) [[@#arg stringByReplacingOccurrencesOfString:@"\"" withString:@""] stringByReplacingOccurrencesOfString:@"@" withString:@""]
#define STRINGIZE2(arg) [NSString stringWithFormat:@"%@ = '%@'", @keypath(arg), arg]

#define KEY_VALUE_1(field) STRINGIZE(field)\

#define KEY_VALUE_2(field, ...)\
[NSString stringWithFormat:@"%@ , %@", STRINGIZE(field), KEY_VALUE_1(__VA_ARGS__)]\

#define KEY_VALUE_3(field, ...)\
[NSString stringWithFormat:@"%@ , %@", STRINGIZE(field), KEY_VALUE_2(__VA_ARGS__)]\

#define KEY_VALUE_4(field, ...)\
[NSString stringWithFormat:@"%@ , %@", STRINGIZE(field), KEY_VALUE_3(__VA_ARGS__)]\

#define KEY_VALUE_5(field, ...)\
[NSString stringWithFormat:@"%@ , %@", STRINGIZE(field), KEY_VALUE_4(__VA_ARGS__)]\

#define KEY_VALUE_6(field, ...)\
[NSString stringWithFormat:@"%@ , %@", STRINGIZE(field), KEY_VALUE_5(__VA_ARGS__)]\

#define KEY_VALUE_7(field, ...)\
[NSString stringWithFormat:@"%@ , %@", STRINGIZE(field), KEY_VALUE_6(__VA_ARGS__)]\

#define KEY_VALUE_8(field, ...)\
[NSString stringWithFormat:@"%@ , %@", STRINGIZE(field), KEY_VALUE_7(__VA_ARGS__)]\

#define KEY_VALUE_(N, ...) CONCATENATE(KEY_VALUE_, N)( __VA_ARGS__)

#define GET_KEY_VALUE(...) KEY_VALUE_(PP_NARG( __VA_ARGS__),  __VA_ARGS__)
