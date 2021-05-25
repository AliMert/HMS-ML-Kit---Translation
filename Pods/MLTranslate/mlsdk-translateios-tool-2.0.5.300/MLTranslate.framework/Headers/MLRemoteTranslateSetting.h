//
// Copyright (c) Huawei Technologies Co., Ltd. 2020-2028. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MLRemoteTranslateSetting : NSObject

/// Source language encoding (ISO 639-1 standard encoding).
@property(nonatomic, copy, readonly) NSString *sourceLangCode;

/// Target language encoding (ISO 639-1 standard encoding).
@property(nonatomic, copy, readonly) NSString *targetLangCode;

/// Creates a configurator instance for the text translator.
/// @param sourceLangCode Source language encoding (ISO 639-1 standard encoding).
/// @param targetLangCode Target language encoding (ISO 639-1 standard encoding).
- (instancetype)initWithSourceLangCode:(NSString *)sourceLangCode targetLangCode:(NSString *)targetLangCode;

/// Gets the source language encoding
-(NSString *)getSourceLangCode;

/// Gets the target language encoding
-(NSString *)getTargetLangCode;

@end

NS_ASSUME_NONNULL_END
