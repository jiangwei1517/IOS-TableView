//
//  Hero.m
//  英雄联盟TableView
//
//  Created by jiangwei18 on 17/6/11.
//  Copyright © 2017年 jiangwei18. All rights reserved.
//

#import "Hero.h"

@implementation Hero
- (instancetype)initWithDict:(NSDictionary*)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)heroWithDict:(NSDictionary*)dict {
    return [[Hero alloc]initWithDict:dict];
}
@end
