//
//  MOPImage.h
//  SuperHeroC
//
//  Created by Maxwell Poffenbarger on 1/30/20.
//  Copyright © 2020 Maxwell Poffenbarger. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MOPImage : NSObject

@property (nonatomic, copy, readonly)NSString *imageURL;

- (instancetype)initWithImageURL:(NSString *)imageURL;

@end

@interface MOPImage (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)dictionary;

@end

NS_ASSUME_NONNULL_END
