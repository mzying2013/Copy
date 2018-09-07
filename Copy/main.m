//
//  main.m
//  Copy
//
//  Created by Liu on 2018/9/3.
//  Copyright © 2018年 mzying.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CopyObj.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        NSArray<CopyObj *>  * batch = [CopyObj batchInstance];
//
//        NSLog(@"-------------");
//        for (NSUInteger index = 0; index < batch.count; index++){
//            id obj = batch[index];
//            NSLog(@"%08x,%p",&obj,obj);
//        }
//        
//        
//        CopyObj * obj1 = [[CopyObj alloc] initWithName:@"first" age:0];
//        CopyObj * obj2 = [[CopyObj alloc] initWithName:@"second" age:1];
//        
//        NSLog(@"-------------");
//        NSLog(@"%x,%p",&obj1,obj1);
//        NSLog(@"%x,%p",&obj2,obj2);
//        
//        
//
        //对象的生命周期在for循环内当前循环有效，地址一样是正常的，为了更快索引到空闲空间系统用了同一个地址
                
        
        
        
        NSLog(@"Copy之前:%@",batch);

        NSArray * batchCopy = [batch copy];

        NSLog(@"Copy之后：%@",batchCopy);

        for (CopyObj * obj in batchCopy){
            obj.name = @"Copy";
        }
        NSLog(@"Copy修改之后：%@",batch);



        NSMutableArray * batchMutableCopy = [batch mutableCopy];

        NSLog(@"Mutable 之后：%@",batchMutableCopy);

        for (CopyObj * obj in batchMutableCopy){
            obj.name = @"MutableCopy";
            obj.age = 100;
        }
        NSLog(@"Mutable 修改之后：%@",batch);
        
        
        
        NSMutableArray * batchNewArray = [[NSMutableArray alloc] initWithArray:batch copyItems:YES];
        NSLog(@"New 之前：%@",batchNewArray);
        
        for (CopyObj * obj in batchNewArray){
            obj.name = @"NewCopy";
            obj.age = 100;
        }
        NSLog(@"New 之后：%@",batchNewArray);
        NSLog(@"New 修改之后：%@",batch);
        
        
        NSMutableData * mData = [NSMutableData new];
        NSMutableData * mCopyData = [mData mutableCopy];
        NSMutableData * copyData = [mData copy];
        NSLog(@"%p %p %p",mData,mCopyData,copyData);
        
        NSData * data = [NSData new];
        NSMutableArray * mCopyData2 = [data mutableCopy];
        NSData * copyData2 = [data copy];
        NSLog(@"%p %p %p",data,mCopyData2,copyData2);
        
        
    }
    return 0;
}
