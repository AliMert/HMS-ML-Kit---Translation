//
// Copyright (c) Huawei Technologies Co., Ltd. 2020-2028. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

static int INNER = 2;
static int INACTIVE = 3;
static int NOT_SUPPORTED = 4;
static int ILLEGAL_PARAMETER = 5;
static int NO_PERMISSION = 9;
static int ANALYSIS_FAILURE = 11;
static int AUTHENTICATION_REQUIRED = 15;
static int TOKEN_INVALID = 19;

@interface MLTranslateException : NSObject
/// Error code
@property(nonatomic, assign, readonly) int code;

/// The error message
@property(nonatomic, copy, readonly) NSString *message;

/// Create a translation exception instance
/// @param code  Error code
/// @param message The error message
- (instancetype)initWithCode:(int)code message:(NSString *)message;
@end

NS_ASSUME_NONNULL_END

