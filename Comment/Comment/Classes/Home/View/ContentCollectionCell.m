//
//  ContentCollectionCell.m
//  Comment
//
//  Created by 胡猛 on 2016/12/4.
//  Copyright © 2016年 HuMeng. All rights reserved.
//

#import "ContentCollectionCell.h"
#import "HeaderCollectionCell.h"

@interface ContentCollectionCell()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end


static NSString *headCellID = @"headCellID";

@implementation ContentCollectionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"HeaderCollectionCell" bundle:nil] forCellWithReuseIdentifier:headCellID];
}



-(void)layoutSubviews
{
    [super layoutSubviews];
    
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)self.collectionView.collectionViewLayout;
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    layout.itemSize = CGSizeMake(self.collectionView.bounds.size.width / 5, self.collectionView.bounds.size.height / 2);
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.titleArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HeaderCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:headCellID forIndexPath:indexPath];
    cell.titleStr = self.titleArray[indexPath.item];
    cell.imageStr= self.imageArray[indexPath.item];
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%ld",indexPath.item);
}

@end
