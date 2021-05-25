//
// Copyright (c) Huawei Technologies Co., Ltd. 2020-2028. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class MLRemoteTranslateSetting;
@class MLTranslateException;

@interface MLRemoteTranslator : NSObject

- (instancetype)init NS_UNAVAILABLE;

+ (instancetype)new NS_UNAVAILABLE;

- (id)copy NS_UNAVAILABLE;

- (id)mutableCopy NS_UNAVAILABLE;

/// Text translator
+ (instancetype)sharedInstance;

/// Configure the text translator
/// @param settings Text translator configuration instance
- (void)setRemoteTranslator:(MLRemoteTranslateSetting *)settings;

/// Asynchronous text translation
/// @param text Text to be translated
/// @param addOnSuccessListener Translated callback successfully
/// @param addOnFailureListener Translation failed callback
- (void)asyncTranslate:(NSString *)text addOnSuccessListener:(void (^)(NSString *text))addOnSuccessListener addOnFailureListener:(void (^)(MLTranslateException *exception))addOnFailureListener;

/// Synchronous translation of text.
/// @param text Text to be translated.
/// @param addOnSuccessListener Translated callback successfully
/// @param addOnFailureListener Translation failed callback
-(void)syncTranslate:(NSString *)text addOnSuccessListener:(void (^)(NSString *text))addOnSuccessListener addOnFailureListener:(void (^)(MLTranslateException *exception))addOnFailureListener;

@end

NS_ASSUME_NONNULL_END
