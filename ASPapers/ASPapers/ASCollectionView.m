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
    
    CGFloat tUpdate;
    CGFloat nextValue;
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
        [self setCollectionViewLayout:self.layoutBig animated:NO];
    }
    
    return self;

}


-(void)collectionZoomForScale:(CGFloat)nextScale
{

    NSLog(@"Drag&Scale %@ - %1.2f :::: %d",self.transitionLayout,nextScale, self.isExclusiveTouch);
    if (!self.transitionLayout) {
        UICollectionViewLayout *toLayout = self.layoutSmall == self.collectionViewLayout ? self.layoutBig : self.layoutSmall;
        
        self.transitionLayout = [self startInteractiveTransitionToCollectionViewLayout:toLayout completion:^(BOOL completed, BOOL finish) {
            self.pagingEnabled = self.transitionLayout.nextLayout == self.layoutBig ? YES : NO;
            //[self setCollectionViewLayout:self.transitionLayout.nextLayout];
            self.transitionLayout = nil;
        }];
        [NSTimer scheduledTimerWithTimeInterval:0.06 target:self selector:@selector(updateInteractive:) userInfo:nil repeats:YES];
    }else if(self.transitionLayout) {

       // CGFloat value = self.transitionLayout.currentLayout == self.layoutBig ? scale+nextScale : scale+nextScale;

        self.transitionLayout.transitionProgress = BounceEaseOut(nextScale);//transitionProgress(scale, scale+nextScale, finalScale, BounceEaseOut);
        nextValue = nextScale;
    }
}

-(void)updateInteractive:(NSTimer*)timer
{
    
    tUpdate -= (tUpdate-nextValue)/6;
    self.transitionLayout.transitionProgress = tUpdate;
    [self.transitionLayout invalidateLayout];
    
    if (round(tUpdate) == 1.0 || floor(tUpdate) == 0.0) {
        [timer invalidate];
        [self finishInteractiveTransition];

    }

}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    tStartLoc = [touch locationInView:(UIView*)self];
    NSLog(@"START %f",tStartLoc.y);
    scale = self.collectionViewLayout == self.layoutBig ? 1.0 : kASCollectionCellSmallScale;
    tUpdate = nextValue = 0.0;
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    tEndLoc = [touch locationInView:(UIView*)self];
    NSLog(@"** MOVED end:%1.2f > start:%1.2f",tEndLoc.y,tStartLoc.y);
    CGFloat xx = tEndLoc.x-tStartLoc.x;
    CGFloat yy = tEndLoc.y-tStartLoc.y;
    distance = (sqrtf(xx*xx+yy*yy)/self.bounds.size.height)*1.2;
    NSLog(@"MOVE distance:%f and scale:%1.2f",distance,scale);
    /*if (tEndLoc.y > tStartLoc.y) {
        distance *= -1;
    }*/
    
    distance = MIN(1.1, distance);
    distance = MAX(0.3, distance);
    
    [self collectionZoomForScale:distance];
}


-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"END %@ %f",self.transitionLayout,distance);

    if(self.transitionLayout){
        if (tUpdate > 0.5) {
            nextValue = 1.0;
        }else{
            nextValue = 0.0;
        }
    }else{
        UICollectionViewFlowLayout *currentLayout = scale == 1.0 ? self.layoutSmall : self.layoutBig;
        self.pagingEnabled = currentLayout == self.layoutBig ? YES : NO;
        [self setCollectionViewLayout:currentLayout animated:YES completion:^(BOOL finished) {
            
        }];
    }
}

-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (tUpdate > 0.5) {
        nextValue = 1.0;
    }else{
        nextValue = 0.0;
    }
}

@end
