//
//  ASFeedManager.h
//  ASPapers
//
//  Created by Antonio_Stilo on 6/29/14.
//  Copyright (c) 2014 Antonio_Stilo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

#define kASFEED_MAX_COUNT 6

typedef void(^getarray_t)(NSArray *data);

@interface ASFeedManager : NSObject

@property (nonatomic) NSUInteger from;
-(void)loadItems:(getarray_t)completiton;

+ (ASFeedManager *)sharedInstance;

@end
