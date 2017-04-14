//
//  UserEntity.h
//  SQLMaker
//
//  Created by zhangwx on 2017/2/23.
//  Copyright © 2017年 zhangwx. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, SEX) {
    Man,
    Woman,
    Other,
};

@class City;

@interface UserEntity : NSObject

@property (nonatomic, strong) NSString *username;
@property (nonatomic) NSInteger userId;
@property (nonatomic) SEX sex;
@property (nonatomic, strong) City *city;
@property (nonatomic, strong) NSArray <UserEntity *> *friends;

@end

@interface City : NSObject

@property (nonatomic) NSInteger cityId;
@property (nonatomic, strong) NSString *cityName;

@end
