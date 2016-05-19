//
//  ViewController.m
//  04-UICollectionViewDemo
//
//  Created by qingyun on 16/4/16.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

#import "ViewController.h"
#import "QYAppModel.h"
#import "QYCollectionViewCell.h"
@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) NSArray *apps;
@end

@implementation ViewController
static NSString *identifier = @"appcell";
static NSString *headerIdentifier = @"appHeaderView";
static NSString *footerIdentifier = @"appFooterView";
//懒加载数据
-(NSArray *)apps{
    if (_apps == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"apps" ofType:@"plist"];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *models = [NSMutableArray array];
        for (NSDictionary *dict in array) {
            QYAppModel *appModel = [QYAppModel appModelWithDictionary:dict];
            [models addObject:appModel];
        }
        _apps = models;
    }
    return _apps;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //布局对象
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(80, 90);
    
    //行间距
    layout.minimumLineSpacing = 30;
    //item间距
    //layout.minimumInteritemSpacing = 18.3;
    //section头
    layout.headerReferenceSize = CGSizeMake(0, 20);
    layout.footerReferenceSize = CGSizeMake(0, 20);
    //sctionInset
    layout.sectionInset = UIEdgeInsetsMake(0, 20, 0, 20);
    //头悬浮
    layout.sectionHeadersPinToVisibleBounds = YES;
    //尾悬浮
    layout.sectionFootersPinToVisibleBounds = YES;
    
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
   
    
    //创建并添加collectionView
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 375, 90) collectionViewLayout:layout];
    [self.view addSubview:collectionView];
    collectionView.backgroundColor = [UIColor whiteColor];
    //设置数据源和代理
    collectionView.dataSource = self;
    collectionView.delegate = self;
    
    //注册cell
    [collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([QYCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:identifier];
    
    //注册headerView、footerView
    [collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerIdentifier];
    [collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:footerIdentifier];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark  -UICollectionViewDataSource
//sections
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2;
}
//items
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.apps.count;
}
//cell
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    QYCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    QYAppModel *model = self.apps[indexPath.item];
    cell.appModel = model;
    return cell;
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionReusableView *reusableView = nil;
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerIdentifier forIndexPath:indexPath];
        reusableView.backgroundColor = [UIColor redColor];
    }else if ([kind isEqualToString:UICollectionElementKindSectionFooter]){
        reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:footerIdentifier forIndexPath:indexPath];
        reusableView.backgroundColor = [UIColor greenColor];
    }
    return reusableView;
}


#pragma mark -UICollectionViewDelegateFlowLayout
//设置某个item的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(80, 90);
}
//section的缩进
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}
//最小的行间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 20;
}
//item之间最小间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 18.4;
}
//section的headerView的size
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    //当UICollectionViewFlowLayout是垂直滚动的时候高度生效，否则宽度生效
    return CGSizeMake(30, 20);
}
//section的footerView的size
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    //当UICollectionViewFlowLayout是垂直滚动的时候高度生效，否则宽度生效
    return CGSizeMake(30, 20);
}
#if 0
#endif

#pragma mark -菜单
//允许显示菜单
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

//可以相应方法
- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(nullable id)sender{
    if (action == @selector(cut:)) {
        return NO;
    }
    return YES;
}

//处理方法
- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(nullable id)sender{
    
}

//选中item
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    QYCollectionViewCell *cell = (QYCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    NSLog(@"%@",cell.appModel.name);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
