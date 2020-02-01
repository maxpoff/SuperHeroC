//
//  MOPAppearance.h
//  SuperHeroC
//
//  Created by Maxwell Poffenbarger on 1/30/20.
//  Copyright © 2020 Maxwell Poffenbarger. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MOPAppearance : NSObject

@property (nonatomic, copy, readonly)NSString *race;

-(instancetype)initWithRace:(NSString *)race;

@end

@interface MOPAppearance (JSONConvertable)

-(instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)dictionary;

@end

NS_ASSUME_NONNULL_END
