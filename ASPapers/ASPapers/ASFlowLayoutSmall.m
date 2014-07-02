//
//  ASFlowLayoutSmall.m
//  ASPapers
//
//  Created by Antonio_Stilo on 6/30/14.
//  Copyright (c) 2014 Antonio_Stilo. All rights reserved.
//

#import "ASFlowLayoutSmall.h"



@implementation ASFlowLayoutSmall

- (id)init
{
    if (!(self = [super init])) return nil;
    
    CGSize screenSize = [[UIScreen mainScreen] bounds].size;
    CGFloat width = (screenSize.width-4) * kASCollectionCellSmallScale;
    CGFloat height = (screenSize.height-4) * kASCollectionCellSmallScale;
    self.itemSize = CGSizeMake(width, height);
    self.sectionInset = UIEdgeInsetsMake(screenSize.height-height, 0, 0, 0);
    self.minimumInteritemSpacing = 0.0f;
    self.minimumLineSpacing = 4.0f;
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    return self;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)oldBounds
{
    return YES;
}


@end
