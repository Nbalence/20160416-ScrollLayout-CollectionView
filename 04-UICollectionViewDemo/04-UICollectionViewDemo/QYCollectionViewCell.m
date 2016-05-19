//
//  QYCollectionViewCell.m
//  04-UICollectionViewDemo
//
//  Created by qingyun on 16/4/16.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYCollectionViewCell.h"
#import "QYAppModel.h"

@interface QYCollectionViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *downLoadBtn;

@end

@implementation QYCollectionViewCell


-(void)setAppModel:(QYAppModel *)appModel {
    _appModel = appModel;
    
    _iconView.image = [UIImage imageNamed:appModel.icon];
    _titleLabel.text = appModel.name;
    [_downLoadBtn addTarget:self action:@selector(downLoad) forControlEvents:UIControlEventTouchUpInside];
}

-(void)downLoad{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:self.appModel.link]];
}

- (void)awakeFromNib {
    // Initialization code
}

@end
