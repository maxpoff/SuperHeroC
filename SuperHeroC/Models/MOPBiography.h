//
//  MOPBiography.h
//  SuperHeroC
//
//  Created by Maxwell Poffenbarger on 2/1/20.
//  Copyright © 2020 Maxwell Poffenbarger. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MOPBiography : NSObject

@property (nonatomic, copy, readonly)NSString *fullName;

-(instancetype)initWithFullName:(NSString *)fullName;

@end

@interface MOPBiography (JSONConvertable)

-(instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)dictionary;

@end

NS_ASSUME_NONNULL_END
