//
//  ASCollectionView.h
//  ASPapers
//
//  Created by Antonio_Stilo on 6/29/14.
//  Copyright (c) 2014 Antonio_Stilo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASFeedItemCell.h"


@interface ASCollectionView : UIView <UIScrollViewDelegate>
{
    CGPoint tStartLoc;
    CGPoint tEndLoc;
}

@property (nonatomic,strong) UIView *collection;
@property (nonatomic,strong) UIScrollView *scrollView;

-(void)collectionZoomForScale:(CGFloat)nextScale;
-(void)collectionTransition;

-(void)reloadTable;

@end
