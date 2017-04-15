//
//  SQLMakerTests.m
//  SQLMakerTests
//
//  Created by zhangwx on 2017/2/23.
//  Copyright © 2017年 zhangwx. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ZWXSQLMacro.h"
#import "UserEntity.h"

@interface SQLMakerTests : XCTestCase

@end

@implementation SQLMakerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    
    City *city = [[City alloc] init];
    city.cityId = 1;
    city.cityName = @"nj";
    
    UserEntity *friend = [[UserEntity alloc] init];
    friend.userId = 2;
    friend.username = @"zwx2";
    friend.sex = Woman;
    friend.city = city;
    
    UserEntity *friend2 = [[UserEntity alloc] init];
    friend2.userId = 3;
    friend2.username = @"zwx3";
    friend2.sex = Man;
    friend2.city = city;
    
    UserEntity *entity = [[UserEntity alloc] init];
    entity.userId = 1;
    entity.username = @"zwx";
    entity.sex = Man;
    
    {
        NSString *exp = @"select * from UserEntity where sex = 1";
        NSString *test = select(@"*").from(CLASSNAME(UserEntity)).where(PROPNAME_EQUAL_VALUE(friend, sex)).toString;
        XCTAssertEqualObjects(exp, test);
    }
    
    {
        NSString *exp = @"select count(username), max(sex) from UserEntity where sex <> 0 and userId in (select username from UserEntity where sex = 0) group by username, sex order by username ASC";
        NSString *test = select(count(PROPNAME(entity.username)),max(@"sex")).from(@"UserEntity").where(PROPNAME_NOTEQUAL_VALUE(entity,sex), PROPNAME_IN_EPS(entity.userId, select(@"username").from(CLASSNAME(UserEntity)).where(PROPNAME_EQUAL_VALUE(entity, sex)).toString)).groupby(PROPNAME(entity.username), @"sex").orderby(ASC(entity.username)).toString;
        XCTAssertEqualObjects(exp, test);
    }
    
    {
        NSString *makerStr = select(count(PROPNAME(entity.username)),max(@"sex"),@"*").from(CLASSNAME(UserEntity)).where(PROPNAME_NOTEQUAL_VALUE(entity,sex), PROPNAME_IN_EPS(entity.userId, select(PROPNAME(entity.username)).from(CLASSNAME(UserEntity)).where(PROPNAME_EQUAL_VALUE(entity, sex)).toString)).groupby(PROPNAME(entity.username), @"sex").orderby(ASC(PROPNAME(entity.username))).toString;
        NSString *exp = @"select count(username), max(sex), * from UserEntity where sex <> 0 and userId in (select username from UserEntity where sex = 0) group by username, sex order by username ASC";
        XCTAssertEqualObjects(exp, makerStr);
    }
    
    {
        entity.username = @"qwe";
        NSString *exp = @"update UserEntity set username = 'qwe' where userId = 1";
        NSString *test = update(CLASSNAME(UserEntity)).set(PROPNAME_EQUAL_VALUE(entity, username)).where(PROPNAME_EQUAL_VALUE(entity, userId)).toString;
        XCTAssertEqualObjects(exp, test);
    }
    
    {
        NSString *exp = @"insert into UserEntity (username) values ('zwx')";
        NSString *test = insertinto(CLASSNAME(UserEntity)).byprop(PROPNAME_VALUE(entity, username)).toString;
        XCTAssertEqualObjects(exp, test);
    }
    
    {
        NSString *exp = @"insert into Friend (userId, userId) values (1, 2)";
        NSString *test = insertinto(@"Friend").byprop(PROPNAME_VALUE(entity, userId), PROPNAME_VALUE(friend, userId)).toString;
        XCTAssertEqualObjects(exp, test);
    }

    {
        NSString *makerStr = insertinto(CLASSNAME(UserEntity)).byobjc(entity).toString;
        NSString *exp = @"insert into UserEntity (username, userId, sex, city, friends) values ('zwx', 1, 0, '', '')";
        XCTAssertEqualObjects(exp, makerStr);
    }
    
    {
        NSString *exp = @"delete from UserEntity where username in (select username from UserEntity where sex = 0 group by username and sex order by username ASC)";
        NSString *test = deleteFrom(CLASSNAME(UserEntity)).where(PROPNAME_IN_EPS(entity.username, select(PROPNAME(entity.username)).from(CLASSNAME(UserEntity)).where(PROPNAME_EQUAL_VALUE(entity, sex)).groupby(PROPNAME(entity.username), @"sex").orderby(ASC(PROPNAME(entity.username))).toString)).toString;
        XCTAssertEqualObjects(exp, test);
    }
    
}

@end
