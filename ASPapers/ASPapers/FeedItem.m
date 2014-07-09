//
//  FeedItem.m
//  ASPapers
//
//  Created by Antonio_Stilo on 6/29/14.
//  Copyright (c) 2014 Antonio_Stilo. All rights reserved.
//

#import "FeedItem.h"

@implementation FeedItem
@synthesize title,mdescription,date,link;

-(NSString*)description
{
    NSMutableString* s = [NSMutableString stringWithCapacity:2048];
    [s appendFormat:@"** ITEM ******* "
     @"title:%@ "
     @"description:%@ "
     @"date:%@ "
     @"link:%@ ",self.title,self.mdescription,self.date,self.link];
    
    return s;
}

@end
