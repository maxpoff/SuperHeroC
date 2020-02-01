//
//  MOPPowerstats.m
//  SuperHeroC
//
//  Created by Maxwell Poffenbarger on 1/30/20.
//  Copyright © 2020 Maxwell Poffenbarger. All rights reserved.
//

#import "MOPPowerstats.h"

static NSString * const intelligenceKey = @"intelligence";
static NSString * const strengthKey = @"strength";
static NSString * const speedKey = @"speed";
static NSString * const durabilityKey = @"durability";
static NSString * const powerKey = @"power";
static NSString * const combatKey = @"combat";

@implementation MOPPowerstats

- (instancetype)initWithIntelligence:(NSInteger)intelligence strength:(NSInteger)strength speed:(NSInteger)speed durability:(NSInteger)durability power:(NSInteger)power combat:(NSInteger)combat
{
    self = [super init];
    if (self)
    {
        _intelligence = intelligence;
        _strength = strength;
        _speed = speed;
        _durability = durability;
        _power = power;
        _combat = combat;
    }
    return self;
}
@end

@implementation MOPPowerstats (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    NSInteger intelligence = [dictionary[intelligenceKey] intValue];
    NSInteger strength = [dictionary[strengthKey] intValue];
    NSInteger speed = [dictionary[speedKey] intValue];
    NSInteger durability = [dictionary[durabilityKey] intValue];
    NSInteger power = [dictionary[powerKey] intValue];
    NSInteger combat = [dictionary[combatKey] intValue];
    
    return [self initWithIntelligence:intelligence strength:strength speed:speed durability:durability power:power combat:combat];
}
@end
