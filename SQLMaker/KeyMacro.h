//
//  KeyMacro.h
//  SQLMaker
//
//  Created by zhangwx on 2017/2/25.
//  Copyright © 2017年 zhangwx. All rights reserved.
//

#import "KeyMacroTool.h"

#define CONCATENATE(arg1, arg2)   CONCATENATE1(arg1, arg2)
#define CONCATENATE1(arg1, arg2)  CONCATENATE2(arg1, arg2)
#define CONCATENATE2(arg1, arg2)  arg1##arg2


#define PP_NARG(...) \
PP_NARG_(__VA_ARGS__,PP_RSEQ_N())
#define PP_NARG_(...) \
PP_ARG_N(__VA_ARGS__)
#define PP_ARG_N( \
_1, _2, _3, _4, _5, _6, _7, _8, _9,_10, \
_11,_12,_13,_14,_15,_16,_17,_18,_19,_20, \
_21,_22,_23,_24,_25,_26,_27,_28,_29,_30, \
_31,_32,_33,_34,_35,_36,_37,_38,_39,_40, \
_41,_42,_43,_44,_45,_46,_47,_48,_49,_50, \
_51,_52,_53,_54,_55,_56,_57,_58,_59,_60, \
_61,_62,_63,N,...) N
#define PP_RSEQ_N() \
63,62,61,60,                   \
59,58,57,56,55,54,53,52,51,50, \
49,48,47,46,45,44,43,42,41,40, \
39,38,37,36,35,34,33,32,31,30, \
29,28,27,26,25,24,23,22,21,20, \
19,18,17,16,15,14,13,12,11,10, \
9,8,7,6,5,4,3,2,1,0

#define KEY(arg)  (([@#arg rangeOfString:@"\""].location == NSNotFound) ? KEY2(arg) : KEY1(arg))
#define KEY1(arg) [[@#arg stringByReplacingOccurrencesOfString:@"\"" withString:@""] stringByReplacingOccurrencesOfString:@"@" withString:@""]
#define KEY2(arg) [NSString stringWithFormat:@"%@", @keypath(arg)]

#define KEY_1(field) KEY(field)\

#define KEY_2(field, ...)\
[NSString stringWithFormat:@"%@ , %@", KEY(field), KEY_1(__VA_ARGS__)]\

#define KEY_3(field, ...)\
[NSString stringWithFormat:@"%@ , %@", KEY(field), KEY_2(__VA_ARGS__)]\

#define KEY_4(field, ...)\
[NSString stringWithFormat:@"%@ , %@", KEY(field), KEY_3(__VA_ARGS__)]\

#define KEY_5(field, ...)\
[NSString stringWithFormat:@"%@ , %@", KEY(field), KEY_4(__VA_ARGS__)]\

#define KEY_6(field, ...)\
[NSString stringWithFormat:@"%@ , %@", KEY(field), KEY_5(__VA_ARGS__)]\

#define KEY_7(field, ...)\
[NSString stringWithFormat:@"%@ , %@", KEY(field), KEY_6(__VA_ARGS__)]\

#define KEY_8(field, ...)\
[NSString stringWithFormat:@"%@ , %@", KEY(field), KEY_7(__VA_ARGS__)]\

#define KEY_(N, ...) CONCATENATE(KEY_, N)( __VA_ARGS__)

#define GET_KEY(...) KEY_(PP_NARG( __VA_ARGS__),  __VA_ARGS__)


