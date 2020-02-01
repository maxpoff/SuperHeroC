//
//  MOPAppearance.m
//  SuperHeroC
//
//  Created by Maxwell Poffenbarger on 1/30/20.
//  Copyright © 2020 Maxwell Poffenbarger. All rights reserved.
//

#import "MOPAppearance.h"

static NSString * const raceKey = @"race";

@implementation MOPAppearance

- (instancetype)initWithRace:(NSString *)race
{
    self = [super init];
    if (self)
    {
        _race = race;
    }
    return self;
}
@end

@implementation MOPAppearance (JSONConvertable)

-  (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    NSString * race = dictionary[raceKey];
    
    return [self initWithRace:race];
}
@end
