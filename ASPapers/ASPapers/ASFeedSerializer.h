//
//  ASFeedSerializer.h
//  ASPapers
//
//  Created by Antonio_Stilo on 6/29/14.
//  Copyright (c) 2014 Antonio_Stilo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ASFeedSerializer : NSObject

+(NSArray*)deserializeJSONData:(NSDictionary*)data;

@end
