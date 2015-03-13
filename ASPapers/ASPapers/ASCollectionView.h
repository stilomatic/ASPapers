//
//  ASCollectionView.h
//  ASPapers
//
//  Created by Antonio_Stilo on 6/29/14.
//  Copyright (c) 2014 Antonio_Stilo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <TLLayoutTransitioning/UICollectionView+TLTransitioning.h>
#import <TLTransitionLayout.h>
#import "ASFeedItemCell.h"
#import "ASFlowLayoutBig.h"
#import "ASFlowLayoutSmall.h"


@interface ASCollectionView : UICollectionView
{
    CGPoint tStartLoc;
    CGPoint tEndLoc;
}

@property (nonatomic,weak) NSIndexPath *currentIndexPath;
@property (nonatomic,strong) ASFlowLayoutBig *layoutBig;
@property (nonatomic,strong) ASFlowLayoutSmall *layoutSmall;
@property (nonatomic,strong) TLTransitionLayout *transitionLayout;

-(void)collectionZoomForScale:(CGFloat)nextScale;

@end
