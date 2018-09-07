//
//  CopyObj.m
//  Copy
//
//  Created by Liu on 2018/9/3.
//  Copyright © 2018年 mzying.com. All rights reserved.
//

#import "CopyObj.h"


@interface CopyObj()<NSCopying>


@end



@implementation CopyObj

- (NSString *)description{
    return [NSString stringWithFormat:@"%p",self];
//    return [NSString stringWithFormat:@"%%x:&self,%%p:self : %x,%p name:%@", &self,self,self.name];
}


-(instancetype)initWithName:(NSString *)name age:(NSUInteger)age{
    self = [super self];
    
    if (self) {
        self.name = name;
        self.age = age;
    }
    
    return self;
}


+(NSArray<CopyObj *>*)batchInstance{
    CopyObj * first = [[CopyObj alloc] initWithName:@"first" age:0];
    CopyObj * second = [[CopyObj alloc] initWithName:@"second" age:1];
    CopyObj * third = [[CopyObj new] initWithName:@"third" age:2];
    
    return @[first,second,third];
}


#pragma mark - NSCopying
- (id)copyWithZone:(nullable NSZone *)zone{
    return [CopyObj allocWithZone:zone];
}





@end
