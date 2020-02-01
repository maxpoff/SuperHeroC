//
//  MOPPowerstats.h
//  SuperHeroC
//
//  Created by Maxwell Poffenbarger on 1/30/20.
//  Copyright © 2020 Maxwell Poffenbarger. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MOPPowerstats : NSObject

@property (nonatomic, readonly) NSInteger intelligence;
@property (nonatomic, readonly) NSInteger strength;
@property (nonatomic, readonly) NSInteger speed;
@property (nonatomic, readonly) NSInteger durability;
@property (nonatomic, readonly) NSInteger power;
@property (nonatomic, readonly) NSInteger combat;

-(instancetype)initWithIntelligence:(NSInteger)intelligence
                           strength:(NSInteger)strength
                              speed:(NSInteger)speed
                         durability:(NSInteger)durability
                              power:(NSInteger)power
                             combat:(NSInteger)combat;
@end

@interface MOPPowerstats (JSONConvertable)

-(instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)dictionary;

@end

NS_ASSUME_NONNULL_END
