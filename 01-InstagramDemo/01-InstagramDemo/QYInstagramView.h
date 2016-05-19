//
//  QYInstagramView.h
//  01-InstagramDemo
//
//  Created by qingyun on 16/4/16.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QYInstagramView : UIView
@property (nonatomic, strong)  UIImageView *avatarImageView;
@property (nonatomic, strong)  UILabel     *nicknameLabel;
@property (strong, nonatomic)  UIView      *timestampIndicator;
@property (nonatomic, strong)  UILabel     *timestampLabel;
@property (nonatomic, strong)  UIImageView *contentImageView;
@property (nonatomic, strong)  UIView      *likeIndicator;
@property (nonatomic, strong)  UILabel     *likesLabel;
@property (nonatomic, strong)  UIButton    *likeButton;
@property (nonatomic, strong)  UIButton    *commentButton;
@property (nonatomic, strong)  UIButton    *moreButton;
@end
