//
// Copyright (c) Huawei Technologies Co., Ltd. 2020-2028. All rights reserved.
//

#import <Foundation/Foundation.h>



NS_ASSUME_NONNULL_BEGIN


@interface MLTranslateLanguage : NSObject

/// Gets all languages supported by cloud side translation.
/// @param addOnSuccessListener Success callback
/// @param addOnFilureListener Failure callback
+ (void)getCloudAllLanguages:(void(^)(NSArray *__nullable allLangs))addOnSuccessListener addOnFailureListener:(void (^) (MLTranslateException *exception))addOnFilureListener ;

/// Synchronously get all languages supported by cloud side translation
/// @param addOnSuccessListener Success callback
/// @param addOnFilureListener Failure callback
+ (void)syncGetCloudAllLanguages:(void(^)(NSArray *__nullable allLangs))addOnSuccessListener addOnFailureListener:(void (^) (MLTranslateException *exception))addOnFilureListener;




@end

NS_ASSUME_NONNULL_END
