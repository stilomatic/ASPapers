//
//  UILabel+Style.m
//  ASBookingTest
//
//  Created by Antonio_Stilo on 6/28/14.
//  Copyright (c) 2014 Antonio_Stilo. All rights reserved.
//

#import "UILabel+Style.h"

@implementation UILabel (Style)

-(void)setStyle:(UIFont*)font
{
    
    self.font = font;
    self.textColor = [UIColor whiteColor];
    self.shadowColor = [UIColor darkGrayColor];
    self.shadowOffset = CGSizeMake(1.0, 1.0);
    
}

@end
