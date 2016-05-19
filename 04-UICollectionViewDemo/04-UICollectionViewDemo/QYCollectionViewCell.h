//
//  QYCollectionViewCell.h
//  04-UICollectionViewDemo
//
//  Created by qingyun on 16/4/16.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
@class QYAppModel;
@interface QYCollectionViewCell : UICollectionViewCell
@property (nonatomic, strong) QYAppModel *appModel;
@end
