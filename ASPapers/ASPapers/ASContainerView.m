//
//  ASContainerView.m
//  ASPapers
//
//  Created by Antonio_Stilo on 6/29/14.
//  Copyright (c) 2014 Antonio_Stilo. All rights reserved.
//

#import "ASContainerView.h"

@implementation ASContainerView
@synthesize collection;

-(void)layoutSubviews
{
    [super layoutSubviews];
    NSLog(@"OOOOOOOO CONTANINER VIEW");
    self.userInteractionEnabled = YES;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    tStartLoc = [touch locationInView:self];
    NSLog(@"START %f",tStartLoc.y);
    
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{

}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{

    UITouch *touch = [touches anyObject];
    tEndLoc = [touch locationInView:self];
    NSLog(@"END %f",tEndLoc.y);
    
    if (tEndLoc.y > tStartLoc.y) {
        [self collectionTransition:CGRectMake(0.0, 300, self.bounds.size.width, self.bounds.size.height-300)];
    }else{
        [self collectionTransition:self.bounds];
    }

}

-(void)collectionTransition:(CGRect)newFrame
{
    [UIView animateWithDuration:1.0 animations:^{
        collection.frame = newFrame;
    }];
}

@end
