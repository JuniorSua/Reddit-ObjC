//
//  DVMPost.m
//  RedditObjcProject
//
//  Created by Junior Suarez-Leyva on 5/7/20.
//  Copyright © 2020 Junior Suarez-Leyva. All rights reserved.
//

#import "DVMPost.h"

@implementation DVMPost

- (instancetype)initTitleWith:(NSString *)title thumbnail:(NSString *)thumbnail ups:(NSInteger)ups commentCount:(NSInteger)commentCount user:(NSString *)user
{
    self = [super init];
    if (self)
    {
        _title = title;
        _thumbnail = thumbnail;
        _ups = ups;
        _commentCount = commentCount;
        _user = user;
        
    }
    
    return self;
}

- (instancetype)initDictionaryWith:(NSDictionary *)dictionary
{
    NSDictionary *dataDict = dictionary[@"data"];
    
    NSString *title = dataDict[@"title"];
    NSString *thumbnail = dataDict[@"thumbnail"];
    NSInteger ups = [dataDict[@"ups"] intValue];
    NSInteger commentCount = [dataDict[@"num_comments"] integerValue];
    NSString *user = dataDict [@"author"];
    
    return [self initTitleWith:title thumbnail:thumbnail ups:ups commentCount:commentCount user:user];
    
}

@end
