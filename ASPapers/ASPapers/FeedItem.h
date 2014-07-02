//
//  FeedItem.h
//  ASPapers
//
//  Created by Antonio_Stilo on 6/29/14.
//  Copyright (c) 2014 Antonio_Stilo. All rights reserved.
//

#import <Foundation/Foundation.h>

/** RSS JSON ITEM
 "title": "About the security content of iOS 7.1.1",
 "description": "This document describes the security content of iOS 7.1.1.",
 "link": "http://support.apple.com/kb/HT6208",
 "content:encoded": "This document describes the security content of iOS 7.1.1.",
 "pubDate": "Fri, 27 Jun 2014 22:14:30 GMT",
 "guid": "http://support.apple.com/kb/HT6208",
 */

@interface FeedItem : NSObject

@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *mdescription;
@property (nonatomic,copy) NSString *link;
@property (nonatomic,copy) NSString *date;

@end
