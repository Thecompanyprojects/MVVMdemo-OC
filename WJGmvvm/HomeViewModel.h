//
//  HomeViewModel.h
//  WJGmvvm
//
//  Created by 王俊钢 on 2019/2/20.
//  Copyright © 2019 wangjungang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^callback) (NSArray *array);

@interface HomeViewModel : NSObject

- (void)headerRefreshRequestWithCallback:(callback)callback;

@end

NS_ASSUME_NONNULL_END
