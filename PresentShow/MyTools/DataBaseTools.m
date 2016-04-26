//
//  DataBaseTools.m
//  UI_22DataBase
//
//  Created by zxx_ 's compu on 16/2/26.
//  Copyright © 2016年 zxx. All rights reserved.
//

#import "DataBaseTools.h"
#import <sqlite3.h>

@interface DataBaseTools ()

//  数据库存储路径
@property (nonatomic, copy) NSString *dataBasePath;

@end
//  定义全局变量 -为了只保证存在一个 dataBasetool 对象
static DataBaseTools *databasetool = nil;

@implementation DataBaseTools



//      单例设计模式
+ (instancetype)databaseManager {
//    保证整个工程在任何时候获取的 dataBasetool 对象相同
    if (!databasetool) {
        databasetool = [[DataBaseTools alloc] init];
    }
    return databasetool;
}
#pragma mark - 获取数据库存储路径(懒加载)

- (NSString *)dataBasePath {
    if (!_dataBasePath) {
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *path = [paths lastObject];
        self.dataBasePath = [path stringByAppendingString:@"/GiFiTu.sqlite"];
    }
    return _dataBasePath;
}
#pragma mark 打开数据库

//  定义数据库指针
static sqlite3  *db = nil;
- (void)openDataBase {
    //打印路径
    NSLog(@"文件路径 %@", self.dataBasePath);
    int result = sqlite3_open(self.dataBasePath.UTF8String, &db);
    if (result == SQLITE_OK) {
        NSLog(@"数据库成功打开");
    } else {
        NSLog(@"failure,to open");
    }
    
}
#pragma mark _关闭数据库

- (void)closeDataBase {
    int result = sqlite3_close(db);
    if (result == SQLITE_OK) {
        NSLog(@"DataBase成功关闭");
    } else {
        NSLog(@"no success Close DataBase");
    }
}
#pragma mark _建表
- (void)createTable {
    //  1.准备 SQL 语句
    NSString *sqlString = @"create table if not exists gifitu (num integer primary key autoincrement, name text not null unique, url text not null unique)";
    //  2.执行语句
    int result = sqlite3_exec(db, sqlString.UTF8String, NULL, NULL, NULL);
    if (result == SQLITE_OK) {
        NSLog(@"yes,created");
    } else {
        NSLog(@"sorry, create is not success");
    }

}
#pragma mark _插入数据
- (BOOL)insertDataBase:(NSString *)name withAge:(NSString *)url {
    //  1.准备 sql 语句
    NSString *sqlString = [NSString stringWithFormat:@"insert into gifitu (name, url) values ('%@','%@')", name, url];;
    //  2.获取伴随指针 - 数据库的动态指针
    sqlite3_stmt *stmt = NULL;
    //  3.执行
    int result = sqlite3_prepare(db, sqlString.UTF8String, -1, &stmt, NULL);
    if (result == SQLITE_OK) {
        //绑定参数
        sqlite3_bind_text(stmt, 1, name.UTF8String, -1, NULL);
//        sqlite3_bind_int64(stmt, 2, age);
        sqlite3_bind_text(stmt, 2, url.UTF8String, -1, NULL);
        //执行
        if (sqlite3_step(stmt) == SQLITE_DONE) {
            NSLog(@"insert success");
            return YES;
        }  else {
            NSLog(@"failed insert");
            return NO;
        }
    } else {
        NSLog(@"insert语句错误");
    }
      //    关闭伴随指针
    sqlite3_finalize(stmt);
    return NO;

}
//#pragma mark _查询
//- (void)selectDataBase:(NSString *)name {
//    //  1.准备 sql 语句
//    NSString *sqlString = @"select name, url from gifitu where name = ?";
//    //  2.获取伴随指针
//    sqlite3_stmt *stmt = NULL;
//    //  3.执行
//    int result = sqlite3_prepare(db, sqlString.UTF8String, -1, &stmt, NULL);
//    if (result == SQLITE_OK) {
//        //绑定参数
//        sqlite3_bind_text(stmt, 0, name.UTF8String, -1, NULL);
//        //执行
//        while (sqlite3_step(stmt) == SQLITE_ROW) {
//            NSString *selectString = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 1)];
//            NSInteger selectAge = sqlite3_column_int64(stmt, 2);
//            NSLog(@"name:%@ \n age:%ld", selectString, (long)selectAge);
//            
//        }
//    } else {
//        NSLog(@"语句错误");
//    }
//    //关闭伴随指针
//    sqlite3_finalize(stmt);
//}

#pragma mark _修改
- (void)updateDateBase:(NSString *)name withNewName:(NSString *)newName {
    //1 准备 sql.
    NSString *sqlString = @"update gifitu set name = ? where name = ?";
    //2 获取伴随指针
    sqlite3_stmt *stmt = NULL;
    //3 预执行
    int result = sqlite3_prepare(db, sqlString.UTF8String, -1, &stmt, NULL);
    //4 绑定参数
    if (result ==SQLITE_OK) {
        sqlite3_bind_text(stmt, 2, name.UTF8String, -1, NULL);
        sqlite3_bind_text(stmt, 1, newName.UTF8String, -1, NULL);
        if (sqlite3_step(stmt) == SQLITE_DONE) {
            NSLog(@"yes update");
        } else {
            NSLog(@"no , update failed");
        }
        
    }
    sqlite3_finalize(stmt);
}
#pragma mark _删除
- (void)deleteDataBase:(NSString *)name {
//    1.准备数据
    NSString *sqlString = @"delete from gifitu where name = ?";
//    2.准备伴随指针
    sqlite3_stmt *stmt = NULL;
    if (sqlite3_prepare(db, [sqlString UTF8String], -1, &stmt, NULL) == SQLITE_OK) {
        sqlite3_bind_text(stmt, 1, name.UTF8String, -1, NULL);
        if (sqlite3_step(stmt) == SQLITE_DONE) {
                NSLog(@"删除数据成功");
            } else
                NSLog(@"删除失败");
    } else
        NSLog(@"语句错误");
        
    sqlite3_finalize(stmt);
}

#warning 有问题..............................................
#pragma mark 数据库的读取
- (NSArray *)readDatabase {
//    1,准备数据
    NSString *sqling = @"select * from gifitu";
    NSMutableArray *gifiArray = [NSMutableArray arrayWithCapacity:0];
    sqlite3_stmt  *stmt= nil;
//    3.准备,预执行
    if (sqlite3_prepare_v2(db, sqling.UTF8String, -1, &stmt, nil) == SQLITE_OK) {
        
        while (sqlite3_step(stmt) == SQLITE_ROW) {
            
            const unsigned char *name = sqlite3_column_text(stmt, 1);
            const unsigned char *url = sqlite3_column_text(stmt, 2);
            
            NSString *hahaName = [NSString stringWithUTF8String:(const char *)name];
            NSString *hahaURL = [NSString stringWithUTF8String:(const char *)url];
            
            DataBaseModel *model = [[DataBaseModel alloc] init];
            model.dbTitle = hahaName;
            model.dbURL = hahaURL;
            
            [gifiArray addObject:model];
        }
    } else
        NSLog(@"读取数据失败");
    sqlite3_finalize(stmt);
    return gifiArray;
}




@end
