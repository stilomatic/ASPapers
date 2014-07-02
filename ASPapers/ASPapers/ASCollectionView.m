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
}

@end

@implementation ASCollectionView
@synthesize collection, scrollView;
 
-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.userInteractionEnabled = YES;
        self.multipleTouchEnabled = NO;
        scale = kASCollectionCellSmallScale;
    }
    
    return self;

}


/*

-(void)collectionZoomForScale:(CGFloat)nextScale
{
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
    }];

}

-(void)collectionSnap
{
    if (scale < 0.7) {
        self.pagingEnabled = NO;
        self.currentLayout = self.layoutSmall;
        scale = kASCollectionCellSmallScale;
    }else{
        self.pagingEnabled = YES;
        self.currentLayout = self.layoutBig;
        scale = 1.0;
    }
    [self.collectionViewLayout invalidateLayout];
    [self setCollectionViewLayout:self.currentLayout animated:YES];
}

-(void)collectionTransition
{
    if (self.currentLayout == self.layoutBig) {
        self.pagingEnabled = NO;
        self.currentLayout = self.layoutSmall;
        scale = kASCollectionCellSmallScale;
    }else{
        self.pagingEnabled = YES;
        self.currentLayout = self.layoutBig;
        scale = 1.0;
    }
    [self.collectionViewLayout invalidateLayout];
    [self setCollectionViewLayout:self.currentLayout animated:YES];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    tStartLoc = [touch locationInView:(UIView*)self];
    distance = scale;
    NSLog(@"START %f",tStartLoc.y);
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    tEndLoc = [touch locationInView:(UIView*)self];
    NSLog(@"** MOVED %1.2f > %1.2f",tEndLoc.y,tStartLoc.y);
    
    if (tEndLoc.y > tStartLoc.y) {
        distance -= 0.1;
    }else
    {
        distance += 0.1;
    }
    
    NSLog(@"MOVE distance:%f and scale:%1.2f",distance,scale);
    if(distance > 0.2 && distance < 1.05)
    [self collectionZoomForScale:distance];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    //[self collectionSnap];
}

-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"TOUCH CANCELED_-----_-__-__---___-_");
   // [self collectionZoomForScale:distance];
    //[self collectionSnap];
}
 
 */

@end
