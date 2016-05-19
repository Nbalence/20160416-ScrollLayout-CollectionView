//
//  QYInstagramView.m
//  01-InstagramDemo
//
//  Created by qingyun on 16/4/16.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYInstagramView.h"
#import "Masonry.h"
@implementation QYInstagramView
//代码方式初始化
-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self createdAndAddSubviews];
        [self setupSubviews];
    }
    return self;
}
//通过IB的方式初始化
-(instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self createdAndAddSubviews];
        [self setupSubviews];
    }
    return self;
}

//创建并添加子视图
- (void)createdAndAddSubviews {
    _avatarImageView = [[UIImageView alloc] init];
    _nicknameLabel = [[UILabel alloc] init];
    _timestampIndicator = [[UIView alloc] init];
    _timestampLabel = [[UILabel alloc] init];
    _contentImageView = [[UIImageView alloc] init];
    _likeIndicator = [[UIView alloc] init];
    _likesLabel = [[UILabel alloc] init];
    _likeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _commentButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _moreButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [self addSubview:_avatarImageView];
    [self addSubview:_nicknameLabel];
    [self addSubview:_timestampIndicator];
    [self addSubview:_timestampLabel];
    [self addSubview:_contentImageView];
    [self addSubview:_likeIndicator];
    [self addSubview:_likesLabel];
    [self addSubview:_likeButton];
    [self addSubview:_commentButton];
    [self addSubview:_moreButton];
}

-(void)setupSubviews {
    //头像
    _avatarImageView.backgroundColor = [UIColor redColor];
    _avatarImageView.layer.cornerRadius = 17.5;
    _avatarImageView.layer.masksToBounds = YES;
    //昵称
    _nicknameLabel.text = @"money";
    _nicknameLabel.textColor = [UIColor blueColor];
    _nicknameLabel.font = [UIFont boldSystemFontOfSize:23.0];
    //时间
    _timestampIndicator.backgroundColor = [UIColor greenColor];
    
    _timestampLabel.text = @"7小时";
    _timestampLabel.textColor = [UIColor lightGrayColor];
    _timestampLabel.font = _nicknameLabel.font;
    
    //内容视图
    _contentImageView.backgroundColor = [UIColor purpleColor];
    
    //喜欢
    _likeIndicator.backgroundColor = [UIColor orangeColor];
    
    _likesLabel.text = @"32个赞";
    _likesLabel.textColor = [UIColor blueColor];
    _likesLabel.font = _nicknameLabel.font;
    
    _likeButton.backgroundColor = [UIColor grayColor];
    _commentButton.backgroundColor = [UIColor cyanColor];
    _moreButton.backgroundColor = [UIColor magentaColor];
}

-(void)updateConstraints {
    //头像
    [_avatarImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@10);
        make.top.mas_equalTo(20);
        make.size.mas_equalTo(CGSizeMake(35.0, 35.0));
    }];
    
    //昵称
    [_nicknameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_avatarImageView.mas_right).with.offset(10);
    }];
    
    //时间标识
    [_timestampIndicator mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_timestampLabel.mas_left).with.offset(-10);
        make.size.mas_equalTo(CGSizeMake(10, 10));
    }];
    //时间label
    [_timestampLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.centerY.equalTo(@[_nicknameLabel,_timestampIndicator,_avatarImageView]);
    }];
    //内容视图
    [_contentImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_avatarImageView.mas_bottom).with.offset(10);
        make.left.equalTo(@0);
        make.width.equalTo(self);
        make.height.equalTo(self.mas_width);
    }];
    //赞标识
    [_likeIndicator mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_avatarImageView);
        make.top.equalTo(_contentImageView.mas_bottom).with.offset(10);
        make.size.mas_equalTo(CGSizeMake(20.0, 20.0));
    }];
    //赞数量
    [_likesLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_likeIndicator);
        make.left.equalTo(_likeIndicator.mas_right).with.offset(10);
    }];
    //赞按钮
    [_likeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_likeIndicator);
        make.top.equalTo(_likeIndicator.mas_bottom).with.offset(20);
        make.size.mas_equalTo(CGSizeMake(50.0, 25.0));
    }];
    
    //评论按钮
    [_commentButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_likeButton.mas_right).with.offset(5);
        make.size.mas_equalTo(CGSizeMake(60.0, 25.0));
    }];
    
    //更多按钮
    [_moreButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(@(-10));
        make.size.mas_equalTo(CGSizeMake(40.0, 25.0));
        make.centerY.equalTo(@[_likeButton,_commentButton]);
    }];
    
    [super updateConstraints];
}
@end
