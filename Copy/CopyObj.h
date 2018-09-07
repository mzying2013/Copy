//
//  CopyObj.h
//  Copy
//
//  Created by Liu on 2018/9/3.
//  Copyright © 2018年 mzying.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CopyObj : NSObject

@property (nonatomic,strong) NSString * name;
@property (nonatomic,assign) NSUInteger age;

-(instancetype)initWithName:(NSString *)name age:(NSUInteger)age;
+(NSArray<CopyObj *>*)batchInstance;

@end
