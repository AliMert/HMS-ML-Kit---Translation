//
// Copyright (c) Huawei Technologies Co., Ltd. 2020-2028. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MLTranslateApplication : NSObject

/// Get Instance
+ (instancetype)sharedInstance;

/// Set api_key interface
/// @param apiKey The api_key value can be obtained from the AGC configuration file.
- (void)setApiKey:(NSString *)apiKey;

/// Set accessToken interface
/// @param accessToken accessToken Value.
- (void)setAccessToken:(NSString *)accessToken;

@end

NS_ASSUME_NONNULL_END
