//
//  MOPBiography.m
//  SuperHeroC
//
//  Created by Maxwell Poffenbarger on 2/1/20.
//  Copyright © 2020 Maxwell Poffenbarger. All rights reserved.
//

#import "MOPBiography.h"

static NSString * const fullNameKey = @"fullName";

@implementation MOPBiography

- (instancetype)initWithFullName:(NSString *)fullName
{
    self = [super init];
    if (self)
    {
        _fullName = fullName;
    }
    return self;
}
@end

@implementation MOPBiography (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    NSString *fullName = dictionary[fullNameKey];
    
    return [self initWithFullName:fullName];
}
@end
