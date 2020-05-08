//
//  DVMPostController.m
//  RedditObjcProject
//
//  Created by Junior Suarez-Leyva on 5/7/20.
//  Copyright © 2020 Junior Suarez-Leyva. All rights reserved.
//

#import "DVMPostController.h"

static NSString * const baseURLString = @"https://www.reddit.com/r/";

@implementation DVMPostController

+ (instancetype)sharedController
{
    // Shared Instance
        static DVMPostController * sharedInstance = nil;
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            sharedInstance = [DVMPostController new];
        });
        
        return sharedInstance;
    
}

- (void)searchForPostWithSearchTerm:(NSString *)searchTerm completion:(void (^)(NSArray<DVMPost *> * , NSError * ))completion
{
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURL *searchURL = [baseURL URLByAppendingPathComponent:[searchTerm lowercaseString]];
    NSURL *finalURL = [searchURL URLByAppendingPathExtension:@"json"];
    
    [[NSURLSession.sharedSession dataTaskWithURL:finalURL completionHandler:^(NSData *  data, NSURLResponse *  response, NSError *  error) {
        
        if (error)
        {
            NSLog(@"%@", error.localizedDescription);
            completion(nil, error);
            return;
        }
        
        if (!data)
        {
            
            NSLog(@"Error no data returned from task");
            completion(nil, error);
            return;
        }
        
        NSDictionary *topLevelDictionary = [NSJSONSerialization JSONObjectWithData:data options:2 error:&error];
        
        if (!topLevelDictionary || ![topLevelDictionary isKindOfClass:[NSDictionary class]])
        {
            NSLog(@"JSONDictionary is not a dictionary class");
            completion(nil, error);
            return;
        }
        
        NSDictionary *postDataDictionary = topLevelDictionary[@"data"];
        NSArray * childrenArray = postDataDictionary[@"children"];
        
        NSMutableArray *postArray = [NSMutableArray array];
        
        for (NSDictionary *dataDictionary in childrenArray)
        {
            DVMPost *post = [[DVMPost alloc] initDictionaryWith:dataDictionary];
            [postArray addObject:post];
        }
        
        completion(postArray, nil);
        
        
    }]resume];
    
    
    
}

- (void)fetchImagePost:(DVMPost *)post completion:(void (^)(UIImage * _Nonnull))completion
{
    NSString *thumbnailString =[[NSString alloc]initWithFormat:@"%@", post.thumbnail];
    NSURL *finalThumbnailURL = [[NSURL alloc] initWithString:thumbnailString];
    
    [[NSURLSession.sharedSession dataTaskWithURL:finalThumbnailURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error)
        {
            NSLog(@"%@", error.localizedDescription);
            completion(nil);
            return;
        }
        
        if (!data)
        {
            NSLog(@"Error no data returned from image task%@", error);
            completion(nil);
            return;
        }
        
        UIImage *thumbnail = [[UIImage alloc] initWithData:data];
        completion(thumbnail);
        
    }]resume];
    
}

@end
