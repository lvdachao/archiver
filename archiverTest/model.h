//
//  model.h
//  archiverTest
//
//  Created by 铁血-mac on 2017/10/24.
//  Copyright © 2017年 tiexue. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface model : NSObject<NSCoding>

//定义基本属性
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *gender;
@property(nonatomic,assign)int age;


-(void)archiver;

@end
