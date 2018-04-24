//
//  model.m
//  archiverTest
//
//  Created by 铁血-mac on 2017/10/24.
//  Copyright © 2017年 tiexue. All rights reserved.
//

#import "model.h"

@implementation model

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super init];
    if (self) {
        self.name   = [coder decodeObjectForKey:@"name"];
        self.gender = [coder decodeObjectForKey:@"gender"];
        self.age    = [coder decodeIntForKey:@"age"];
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder{
    //
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.gender forKey:@"gender"];
    [aCoder encodeInt:self.age forKey:@"age"];
    
}
#pragma mark  --复杂对象写入文件
-(void)archiver
{
    self.name = @"小美眉";
    self.gender = @"女";
    self.age = 18;
    
    
    //准备路径:
    NSString *path = NSHomeDirectory();
    NSLog(@"%@",path);
    
    path = [path stringByAppendingPathComponent:@"singeGirl"];
    //1:准备存储数据的对象
    NSMutableData *data = [NSMutableData data];
    //2:创建归档对象
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    //3:开始归档
    [archiver encodeObject:self forKey:@"model"];
    //4:完成归档
    [archiver finishEncoding];
    //5:写入文件当中
    BOOL result = [data writeToFile:path atomically:YES];
    if (result) {
        NSLog(@"归档成功:%@",path);
    }else
    {
        NSLog(@"归档不成功!!!");
    }
#pragma mark ---  反归档/反序列化/解码/解档 ----
    //准备解档路径
    NSData *myData = [NSData dataWithContentsOfFile:path];
    //创建反归档对象
    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:myData];
    //反归档
    model *aper = [model new];
    aper = [unarchiver decodeObjectForKey:@"model"];
    //完成反归档
    [unarchiver finishDecoding];
    //测试
    NSLog(@"%@",aper.name);
    NSLog(@"%@",aper.gender);
}

@end
