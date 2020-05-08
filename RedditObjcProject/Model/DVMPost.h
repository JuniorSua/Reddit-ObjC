//
//  DVMPost.h
//  RedditObjcProject
//
//  Created by Junior Suarez-Leyva on 5/7/20.
//  Copyright © 2020 Junior Suarez-Leyva. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DVMPost : NSObject

@property (nonatomic, copy, readonly) NSString * title;
@property (nonatomic, copy, readonly) NSString *thumbnail;
@property (nonatomic, readonly) NSInteger ups;
@property (nonatomic, readonly) NSInteger commentCount;
@property (nonatomic, readonly) NSString *user;

- (instancetype)initTitleWith:(NSString *)title
                    thumbnail:(NSString *)thumbnail
                          ups:(NSInteger)ups
                 commentCount:(NSInteger)commentCount
                         user:(NSString *)user;


- (instancetype)initDictionaryWith:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
