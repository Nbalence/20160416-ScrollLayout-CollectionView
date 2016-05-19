//
//  ViewController.m
//  02-AnimationWithAutolayou
//
//  Created by qingyun on 16/4/16.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *animationView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topConstraint;
@property (nonatomic)       BOOL isDown;                                //是否处于下拉
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)move:(UIButton *)sender {
    if (_isDown){//回退
        _topConstraint.constant = -220.0;
    }else{//下拉
        _topConstraint.constant = 0.0;
    }
    
    [UIView animateWithDuration:0.25 animations:^{
        //调用layoutIfNeeded方法的对象，必须有子视图。否则无动画效果
        [self.view layoutIfNeeded];
    }];
    _isDown = !_isDown;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
