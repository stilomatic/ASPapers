//
//  ASCollectionView.m
//  ASPapers
//
//  Created by Antonio_Stilo on 6/29/14.
//  Copyright (c) 2014 Antonio_Stilo. All rights reserved.
//

#import "ASCollectionView.h"
#import <AHEasing/easing.h>
#import <pop/POP.h>

@interface ASCollectionView ()
{
    CGFloat distance;
    CGFloat scale;
    UICollectionViewFlowLayout *moveLayout;
}

@end

@implementation ASCollectionView
@synthesize layoutBig,layoutSmall,currentIndexPath,transitionLayout;
 
-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.userInteractionEnabled = YES;
        self.multipleTouchEnabled = NO;
        self.layoutBig = [ASFlowLayoutBig new];
        self.layoutSmall = [ASFlowLayoutSmall new];
        self.pagingEnabled = NO;
        [self setCollectionViewLayout:self.layoutSmall animated:NO];
        scale = kASCollectionCellSmallScale;
    }
    
    return self;

}


-(void)collectionZoomForScale:(CGFloat)transitionPercentage
{
    /*
    [self.collectionViewLayout invalidateLayout];
    scale = nextScale;
    CGFloat duration = 0.1;
    AHEasingFunction _ease = LinearInterpolation;
    if(!moveLayout){
        moveLayout = [UICollectionViewFlowLayout new];
    }
    moveLayout.itemSize = CGSizeMake(self.bounds.size.width * scale, self.bounds.size.height * scale);
    UIEdgeInsets insets = { .left = (self.bounds.size.width - moveLayout.itemSize.width)*0.5, .right = 0, .top = self.bounds.size.height - moveLayout.itemSize.height - 20, .bottom = 0 };
    moveLayout.sectionInset = insets;
    moveLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    [self transitionToCollectionViewLayout:moveLayout duration:duration easing:_ease completion:^(BOOL completed, BOOL finish) {
        if (finish) {
            //[self collectionSnap];
        }
    }];*/
    NSLog(@"Drag&Scale %@ - %1.2f",self.transitionLayout,transitionPercentage);
    if (!self.transitionLayout) {
    
    
    } else {}
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    tStartLoc = [touch locationInView:(UIView*)self];
    NSLog(@"START %f",tStartLoc.y);
    scale = self.collectionViewLayout == self.layoutBig ? 1.0 : kASCollectionCellSmallScale;
    self.pagingEnabled = self.collectionViewLayout == self.layoutBig ? YES : NO;
    
    if (!self.transitionLayout) {
        UICollectionViewLayout *toLayout = self.layoutSmall == self.collectionViewLayout ? self.layoutBig : self.layoutSmall;
        
        UICollectionViewTransitionLayout *currentTransition = [self startInteractiveTransitionToCollectionViewLayout:toLayout completion:^(BOOL completed, BOOL finish) {
            if (finish) {
                self.contentOffset = self.transitionLayout.toContentOffset;
            } else {
                self.contentOffset = self.transitionLayout.fromContentOffset;
            }
        
            [self setCollectionViewLayout:self.transitionLayout.nextLayout animated:NO];
            self.transitionLayout = nil;

        }];
        
        NSArray *visiblePoses = [self.collectionViewLayout layoutAttributesForElementsInRect:self.bounds];
        NSMutableArray *visibleIndexPaths = [NSMutableArray arrayWithCapacity:visiblePoses.count];
        for (UICollectionViewLayoutAttributes *pose in visiblePoses) {
            [visibleIndexPaths addObject:pose.indexPath];
        }
        NSLog(@"**Drage&Scale transition from:%@ to:%@",currentTransition.currentLayout,currentTransition.nextLayout);
        self.transitionLayout = [[TLTransitionLayout alloc] initWithCurrentLayout:currentTransition.currentLayout nextLayout:currentTransition.nextLayout];
        self.transitionLayout.toContentOffset = [self toContentOffsetForLayout:self.transitionLayout indexPaths:visibleIndexPaths placement:TLTransitionLayoutIndexPathPlacementCenter];
        [self setCollectionViewLayout:self.transitionLayout animated:NO];
    }
   
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    tEndLoc = [touch locationInView:(UIView*)self];
    NSLog(@"** MOVED %1.2f > %1.2f",tEndLoc.y,tStartLoc.y);
    CGFloat xx = tEndLoc.x-tStartLoc.x;
    CGFloat yy = tEndLoc.y-tStartLoc.y;
    distance = (sqrtf(xx*xx+yy*yy)/self.bounds.size.height);
    NSLog(@"MOVE distance:%f and scale:%1.2f",distance,scale);
    if (tEndLoc.y > tStartLoc.y) {
        distance *= -1;
    }
    if(self.transitionLayout) {
        // CGFloat startScale = self.transitionLayout.nextLayout == self.layoutBig ? kASCollectionCellSmallScale : 1.0;
        CGFloat finalScale = self.transitionLayout.currentLayout == self.layoutBig ? kASCollectionCellSmallScale : 1.0;
        self.transitionLayout.transitionProgress = transitionProgress(scale, scale+distance, finalScale, BounceEaseOut);
        
    }
}

-(void)finishTransition
{
    if(self.transitionLayout){
        if (self.transitionLayout.transitionProgress > 0.5) {
            [self finishInteractiveTransition];
        } else {
            [self cancelInteractiveTransition];
        }
    }
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    //[self finishTransition];
}

-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"TOUCH CANCELED_-----_-__-__---___-_");
    //[self finishTransition];
}

@end
