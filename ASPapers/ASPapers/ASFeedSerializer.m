//
//  ASFeedSerializer.m
//  ASPapers
//
//  Created by Antonio_Stilo on 6/29/14.
//  Copyright (c) 2014 Antonio_Stilo. All rights reserved.
//

#import "ASFeedSerializer.h"
#import "FeedItem.h"

@implementation ASFeedSerializer

+(NSArray*)deserializeJSONData:(NSDictionary*)data
{
    NSMutableArray *result = [NSMutableArray new];
    NSArray *list = (NSArray*)[[data objectForKey:@"value"] objectForKey:@"items"];
    
    [list enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSDictionary *object = (NSDictionary*)obj;
        FeedItem *item = [FeedItem new];
        if([object objectForKey:@"title"])item.title = [object objectForKey:@"title"];
        if([object objectForKey:@"description"])item.mdescription = [object objectForKey:@"description"];
        if([object objectForKey:@"pubDate"])item.date = [object objectForKey:@"pubDate"];
        if([object objectForKey:@"link"])item.link = [object objectForKey:@"link"];
        [result addObject:item];
    }];
    
    if (result.count == 0) {
        return nil;
    }
    
    return result;
}

@end
