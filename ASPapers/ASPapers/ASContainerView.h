//
//  ASContainerView.h
//  ASPapers
//
//  Created by Antonio_Stilo on 6/29/14.
//  Copyright (c) 2014 Antonio_Stilo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ASContainerView : UIView
{
    CGPoint tStartLoc;
    CGPoint tEndLoc;
}

@property (nonatomic,strong) IBOutlet UICollectionView *collection;

@end
