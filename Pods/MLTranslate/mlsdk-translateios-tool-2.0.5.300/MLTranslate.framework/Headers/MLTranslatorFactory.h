//
// Copyright (c) Huawei Technologies Co., Ltd. 2020-2028. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class MLRemoteTranslator;
@class MLRemoteTranslateSetting;


@interface MLTranslatorFactory : NSObject

+ (instancetype)getInstance;

/// Gets the cloud side text translator instance based on the specified cloud side text translator configuration.
/// @param setting The specified cloud side text translator instance.
-(MLRemoteTranslator*)getRemoteTranslator:(MLRemoteTranslateSetting*)setting;



@end

NS_ASSUME_NONNULL_END
