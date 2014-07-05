//
//  ASFeedItemCell.m
//  ASPapers
//
//  Created by Antonio_Stilo on 6/29/14.
//  Copyright (c) 2014 Antonio_Stilo. All rights reserved.
//

#import "ASFeedItemCell.h"
#import "UILabel+Style.h"
#import "ASCollectionView.h"

@implementation ASFeedItemCell
@synthesize data,randomColor,colorView,titleLabel,dateLabel,descriptionLabel,delegate;

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.layer.cornerRadius = 14.0;
        self.layer.masksToBounds = YES;
        self.layer.shadowColor = [UIColor blackColor].CGColor;
        self.layer.shadowOffset = CGSizeMake(4.0, 4.0);
        self.layer.shadowOpacity = 0.6,
        self.layer.shadowRadius = 10.0;
        self.randomColor = UIRandomColor;
    }
    return self;
}

-(void)load
{
    preloader = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    preloader.center = self.center;
    [preloader startAnimating];
    [self addSubview:preloader];
    
    [delegate updateFeed];
}

-(void)layoutSubviews
{

    self.colorView.backgroundColor = self.randomColor;
    self.descriptionLabel.text = @"";
    [preloader removeFromSuperview];
    
    
    if (data.title) {
        [self.titleLabel setStyle:[UIFont boldSystemFontOfSize:24]];
        self.titleLabel.text = data.title;
        
        [self.dateLabel setStyle:[UIFont systemFontOfSize:18]];
        self.dateLabel.text = data.date;
        
        if (![data.mdescription isKindOfClass:[NSNull class]]) {
            self.descriptionLabel.text = data.mdescription;
            self.descriptionLabel.textColor = self.randomColor;
            self.descriptionLabel.textAlignment = NSTextAlignmentJustified;
        }

    }else{
        self.titleLabel.text = @"";
        self.dateLabel.text = @"";
        self.colorView.frame = self.bounds;
        [self  load];
    }
    
}
@end
