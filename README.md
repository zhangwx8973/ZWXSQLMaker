# ZWXSQLMaker
## 通过链式编程的形式构建SQL语句，提供了强大的属性操作工具，再也不用担心写错字段或关键字了！
### 本库相对于CoreData和目前存在的一些ORM类型的库而言，更注重灵活性，适合较复杂的数据业务。ORM类型的库最大的软肋就是诸如联表查询、多表关联性存储等较复杂业务的支持不足，而且对数据模型的侵入较为严重。同时，其内部生成的sql语句往往不是最优解，并且很难进行优化。
### 本库最大的特色在于一目了然的api，一系列属性操作工具，巧妙的利用xcode自带的语法提示，相当于一个有语法提示的sql编辑器！同时没有过多的黑科技，也没有过度的功能封装掣肘您的发挥，让您根据具体的业务写出最高效的sql!
### 由于本库的目标是构建SQL语句，并通过一系列宏定义在语法上帮助检查了SQL语句的正确性，所以本库的最终结果是输出SQL的字符串，不负责执行SQL语句，使用者可以结合FMDB或Sqlite3库进行数据库的执行操作。

## 构建Sql的api：
### select(NSString *colume, ...) 构建select部分
### from(NSString *tableName, ...) 构建from部分
### where(NSString *where, ...) 构建where expression部分
### count(NSString *count) 构建count函数部分
### max(NSString *max) 构建max函数部分
### groupby(NSString *groupby) 构建groupby函数部分
### orderby(NSString *orderby) 构建orderby函数部分
### ASC(x)根据对象属性构建ASC
### DESC(x)根据对象属性构建desc

### update(NSString *tableName, ...) 构建update部分
### set(NSString *setExpression, ...) 构建set expression部分

### insertinto(NSString *tableName) 构建insert into部分
### byprop(NSString *insertColume, ...) 根据key-value的形式构建(xx) values ('xx')
### byobjc(id x)根据对象的属性构建(xx) values ('xx')

### deleteFrom(NSString *tableName) 构建delete from部分

## 构建各种字段的api
### PROPNAME(x) 输出属性名称,比如：PROPNAME(userInfo.username) -> username
### PROPNAME_EQUAL_VALUE(x,y) 输出属性名称等于其值的字符串,比如：userInfo.username = 'zwx'; PROPNAME_EQUAL_VALUE(userInfo,username) -> username = 'zwx'
### PROPNAME_NOTEQUAL_VALUE(x,y) 输出属性名称不等于其值的字符串,比如：userInfo.userId = 123; PROPNAME_NOTEQUAL_VALUE(userInfo,userId) -> userId <> 123
### PROPNAME_BIGGERTHAN_VALUE(x,y) 输出属性名称大于其值的字符串,比如：userInfo.userId = 123; PROPNAME_BIGGERTHAN_VALUE(userInfo,userId) -> userId > 123
### PROPNAME_SMALLERTHAN_VALUE(x,y) 输出属性名称大于其值的字符串,比如：userInfo.userId = 123; PROPNAME_BIGGERTHAN_VALUE(userInfo,userId) -> userId < 123

### PROPNAME_EQUAL_EPS(x,y) 输出属性名称等于表达式的字符串,比如：PROPNAME_EQUAL_EPS(userInfo.userId,@"select userId from User where userName = 'zwx'") -> userId = (select userId from User where userName = 'zwx')

### PROPNAME_NOTEQUAL_EPS(x,y) 输出属性名称不等于表达式的字符串,比如：PROPNAME_NOTEQUAL_EPS(userInfo.userId,@"select userId from User where userName = 'zwx'") -> userId <> (select userId from User where userName = 'zwx')

### PROPNAME_BIGGERTHAN_EPS(x,y) 输出属性名称大于表达式的字符串,比如：PROPNAME_BIGGERTHAN_EPS(userInfo.userId,@"select userId from User where userName = 'zwx'") -> userId > (select userId from User where userName = 'zwx')

### PROPNAME_SMALLERTHAN_EPS(x,y) 输出属性名称小于表达式的字符串,比如：PROPNAME_SMALLERTHAN_EPS(userInfo.userId,@"select userId from User where userName = 'zwx'") -> userId < (select userId from User where userName = 'zwx')

### PROPNAME_IN_EPS(x,y) 输出属性名称包含表达式结果的字符串,比如：PROPNAME_IN_EPS(userInfo.userId,@"select userId from User where userName = 'zwx'") -> userId in (select userId from User where userName = 'zwx')

### PROPNAME_VALUE(x,y) 输出属性名称和值,比如userInfo.userId = 123; PROPNAME_VALUE(userInfo,userId) -> userId-123,配合byprop(NSString *insertColume, ...)使用

## 使用案例
可以参考SQLMakerTests.m中的测试用例
