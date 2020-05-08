//
//  DVMPostController.h
//  RedditObjcProject
//
//  Created by Junior Suarez-Leyva on 5/7/20.
//  Copyright © 2020 Junior Suarez-Leyva. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DVMPost.h"
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DVMPostController : NSObject

+ (instancetype)sharedController;

- (void)searchForPostWithSearchTerm:(NSString *)searchTerm completion:(void(^) (NSArray<DVMPost *> *post, NSError * error))completion;

- (void)fetchImagePost:(DVMPost *)post completion:(void(^)(UIImage *))completion;



@end

NS_ASSUME_NONNULL_END
