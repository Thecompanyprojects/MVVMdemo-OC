//
//  HomeViewModel.m
//  WJGmvvm
//
//  Created by 王俊钢 on 2019/2/20.
//  Copyright © 2019 wangjungang. All rights reserved.
//

#import "HomeViewModel.h"
#import "HomeModel.h"

@implementation HomeViewModel

- (void)headerRefreshRequestWithCallback:(callback)callback
{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        sleep(2);
        dispatch_async(dispatch_get_main_queue(), ^{
            //               主线程刷新视图
            NSMutableArray *arr=[NSMutableArray array];
            for (int i=0; i<16; i++) {
                int x = arc4random() % 100;
                NSString *string=[NSString stringWithFormat:@"    (random%d) 君子性非异也，善假于物也！",x];
                HomeModel *model=[[HomeModel alloc] init];
                model.titleStr=string;
                [arr addObject:model];
            }
            callback(arr);
        });
    });
}

@end
