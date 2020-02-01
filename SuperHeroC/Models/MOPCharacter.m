//
//  Character.m
//  SuperHeroC
//
//  Created by Maxwell Poffenbarger on 1/30/20.
//  Copyright © 2020 Maxwell Poffenbarger. All rights reserved.
//

#import "MOPCharacter.h"
#import "MOPAppearance.h"
#import "MOPPowerstats.h"
#import "MOPBiography.h"
#import "MOPImage.h"

static NSString * const nameKey = @"name";
static NSString * const raceKey = @"race";
static NSString * const powerstatsKey = @"powerstats";
static NSString * const appearanceKey = @"appearance";
static NSString * const biographyKey = @"biography";
static NSString * const imagesKey = @"images";
static NSString * const mediumImageKey = @"md";

@implementation MOPCharacter

- (instancetype)initWithName:(NSString *)name appearance:(MOPAppearance *)appearance powerstats:(MOPPowerstats *)powerstats imageURL:(MOPImage *)imageURL biography:(MOPBiography *)biography
{
    self = [super init];
    if (self)
    {
        _name = name;
        _appearance = appearance;
        _powerstats = powerstats;
        _imageURL = imageURL;
        _biography = biography;
    }
    return self;
}
@end

@implementation MOPCharacter (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)dictionary
{
    NSString *name = dictionary[nameKey];

    MOPAppearance *appearance = [[MOPAppearance alloc] initWithDictionary:dictionary[appearanceKey]];
    MOPPowerstats *powerstats = [[MOPPowerstats alloc] initWithDictionary:dictionary[powerstatsKey]];
    MOPBiography *biography = [[MOPBiography alloc] initWithDictionary:dictionary[biographyKey]];
    MOPImage *image = [[MOPImage alloc] initWithDictionary:dictionary[imagesKey]];
    
    return [self initWithName:name appearance:appearance powerstats:powerstats imageURL:image biography:biography];
}
@end
