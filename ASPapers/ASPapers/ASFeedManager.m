//
//  ASFeedManager.m
//  ASPapers
//
//  Created by Antonio_Stilo on 6/29/14.
//  Copyright (c) 2014 Antonio_Stilo. All rights reserved.
//

#import "ASFeedManager.h"
#import "Constants.h"
#import "ASFeedSerializer.h"

@implementation ASFeedManager
@synthesize from;

-(void)loadItems:(getarray_t)completiton
{
    if (completiton) {
        from++;
        NSString *urlPath = [NSString stringWithFormat:kASFEED_URL_PATH_FORMAT,kASFEED_MAX_COUNT,(from * kASFEED_MAX_COUNT)];
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        manager.responseSerializer = [AFJSONResponseSerializer serializer];
        [manager GET:urlPath parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSArray *dataList = [ASFeedSerializer deserializeJSONData:(NSDictionary*)responseObject];
            completiton(dataList);
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            
        }];
    }
    
}

#pragma mark Singleton

+ (ASFeedManager *)sharedInstance
{
    static ASFeedManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [ASFeedManager new];
        // Do any other initialisation stuff here
    });
    return sharedInstance;
}

-(id)init
{
    self = [super init];
    if (self) {
        from = -1;
    }
    
    return self;
}

@end
