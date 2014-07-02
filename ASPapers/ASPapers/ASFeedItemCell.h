//
//  ASFeedItemCell.h
//  ASPapers
//
//  Created by Antonio_Stilo on 6/29/14.
//  Copyright (c) 2014 Antonio_Stilo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FeedItem.h"

@class ASCollectionView;

#define UIRandomColor [UIColor colorWithRed:(float)(arc4random()%122 /255.0)+0.5 green:(float)(arc4random()%122 /255.0)+0.5 blue:(float)(arc4random()%122 /255.0)+0.5 alpha:1.0]

@protocol ASFeedItemCellDelegate <NSObject>

-(void)updateFeed;

@end

@interface ASFeedItemCell : UICollectionViewCell
{
    UIActivityIndicatorView *preloader;
}

@property (nonatomic) ASCollectionView *collection;
@property (nonatomic,strong) IBOutlet UIView *colorView;
@property (nonatomic,strong) IBOutlet UILabel *titleLabel;
@property (nonatomic,strong) IBOutlet UILabel *dateLabel;
@property (nonatomic,strong) IBOutlet UILabel *descriptionLabel;
@property (nonatomic,strong) UIColor *randomColor;
@property (nonatomic,strong) FeedItem *data;
@property (nonatomic,weak) id<ASFeedItemCellDelegate> delegate;


@end
