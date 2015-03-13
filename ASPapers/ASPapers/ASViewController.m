//
//  ASViewController.m
//  ASPapers
//
//  Created by Antonio_Stilo on 6/29/14.
//  Copyright (c) 2014 Antonio_Stilo. All rights reserved.
//

#import "ASViewController.h"
#import "ASFeedManager.h"
#import "ASFeedItemCell.h"

#define kCellIdentifier @"feedItemCell"

@interface ASViewController ()

@property (nonatomic, strong) NSMutableArray *feedData;

@end

@implementation ASViewController
@synthesize feedData,collectionView;

#pragma mark UICollectionView

/*
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return CGSizeMake((self.view.frame.size.width-4)*self.collectionView.zoomScale, (self.view.frame.size.height-4)*self.collectionView.zoomScale);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0.0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 4.0;
}
- (UIEdgeInsets)collectionView:
(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    
    UIEdgeInsets insets = { .left = 0, .right = 0, .top = 0, .bottom = 0 };
    
    return insets;
}
  */

- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section {
    return feedData.count;
}
- (NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView {
    return 1;
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)_collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ASFeedItemCell *cell = (ASFeedItemCell*)[collectionView dequeueReusableCellWithReuseIdentifier:kCellIdentifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    cell.data = [feedData objectAtIndex:indexPath.row];
    cell.delegate = self;
    [cell setNeedsLayout];
    [cell layoutIfNeeded];
    
    return cell;
}

-(void)updateFeed
{
    if (!isLoading) {
        isLoading = YES;
        ASFeedManager *fm = [ASFeedManager sharedInstance];
        [fm loadItems:^(NSArray *data) {
            if (fm.from == 0) {
                [self.feedData removeLastObject];
                [self.feedData removeLastObject];
            }
            [self.feedData removeLastObject];
            [self.feedData addObjectsFromArray:data];
            [self.feedData addObject:[FeedItem new]];
            [self.collectionView reloadData];
            isLoading = NO;
        }];
    }
}

#pragma mark UIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    isLoading = NO;
    self.feedData = [NSMutableArray new];
    [self.feedData addObject:[FeedItem new]];
    [self.feedData addObject:[FeedItem new]];
    [self.feedData addObject:[FeedItem new]];
    [self.collectionView reloadData];
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
