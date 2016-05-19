//
//  ViewController.m
//  03-UIScrollView+AutoLayout
//
//  Created by qingyun on 16/4/16.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *leftView;
@property (weak, nonatomic) IBOutlet UIImageView *middleView;
@property (weak, nonatomic) IBOutlet UIImageView *rightView;

@property (nonatomic)       NSInteger currentIndex;
@property (nonatomic, strong) NSArray *imagePaths;
@end

@implementation ViewController

-(NSArray *)imagePaths {
    if (_imagePaths == nil) {
        NSMutableArray *array = [NSMutableArray array];
        for (int i = 0; i < 3; i++) {
            NSString *imageName = [NSString stringWithFormat:@"new_feature_%d@2x",i + 1];
            NSString *path = [[NSBundle mainBundle] pathForResource:imageName ofType:@"png"];
            [array addObject:path];
        }
        _imagePaths = array;
    }
    return _imagePaths;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _scrollView.delegate = self;
    NSLog(@"%@",NSStringFromCGSize(_scrollView.contentSize));
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewDidAppear:(BOOL)animated{
    NSLog(@"%@",NSStringFromCGSize(_scrollView.contentSize));

    [self setImageForSubViews];
}

-(NSInteger)enableIndex:(NSInteger)index{
    if (index < 0) {
        return self.imagePaths.count - 1;
    }else{
        return index % self.imagePaths.count;
    }
}

- (void) setImageForSubViews {
    //左边视图
    NSInteger leftIndex = [self enableIndex:_currentIndex - 1];
    _leftView.image = [UIImage imageWithContentsOfFile:self.imagePaths[leftIndex]];
    //中间视图
    NSInteger middleIndex = [self enableIndex:_currentIndex];
    _middleView.image = [UIImage imageWithContentsOfFile:self.imagePaths[middleIndex]];
    //右边视图
    NSInteger rightIndex = [self enableIndex:_currentIndex + 1];
    _rightView.image = [UIImage imageWithContentsOfFile:self.imagePaths[rightIndex]];
    
    //更改偏移量
    _scrollView.contentOffset = CGPointMake(CGRectGetWidth(self.view.frame), 0);
}

#pragma mark -UIScrollViewDelegate
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (scrollView.contentOffset.x == 0) {//右滑动
        _currentIndex--;
    }else if (scrollView.contentOffset.x == CGRectGetWidth(self.view.frame) * 2){//左滑动
        _currentIndex++;
    }
    _currentIndex = [self enableIndex:_currentIndex];
    [self setImageForSubViews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
