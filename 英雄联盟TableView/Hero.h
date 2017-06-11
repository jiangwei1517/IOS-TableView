//
//  Hero.h
//  英雄联盟TableView
//
//  Created by jiangwei18 on 17/6/11.
//  Copyright © 2017年 jiangwei18. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Hero : NSObject

@property(nonatomic, copy)NSString* icon;
@property(nonatomic, copy)NSString* name;
@property(nonatomic, copy)NSString* intro;

- (instancetype)initWithDict:(NSDictionary*)dict;

+ (instancetype)heroWithDict:(NSDictionary*)dict;
@end
