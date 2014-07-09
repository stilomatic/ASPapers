//
//  ASViewController.h
//  ASPapers
//
//  Created by Antonio_Stilo on 6/29/14.
//  Copyright (c) 2014 Antonio_Stilo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASCollectionView.h"
#import "ASFeedItemCell.h"
#import "ASFlowLayoutBig.h"
#import "ASFlowLayoutSmall.h"

@interface ASViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate, ASFeedItemCellDelegate>

{
    BOOL isLoading;
}

@property (nonatomic,strong) IBOutlet ASCollectionView *collectionView;

@end
