//
//  QYAppModel.h
//  04-UICollectionViewDemo
//
//  Created by qingyun on 16/4/16.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QYAppModel : NSObject
@property (nonatomic, strong) NSString *icon;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *link;
-(instancetype)initWithDictionary:(NSDictionary *)dict;
+(instancetype)appModelWithDictionary:(NSDictionary *)dict;
@end
