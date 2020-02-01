//
//  Character.h
//  SuperHeroC
//
//  Created by Maxwell Poffenbarger on 1/30/20.
//  Copyright © 2020 Maxwell Poffenbarger. All rights reserved.
//

#import <Foundation/Foundation.h>
@class MOPAppearance;
@class MOPPowerstats;
@class MOPImage;
@class MOPBiography;

NS_ASSUME_NONNULL_BEGIN

@interface MOPCharacter : NSObject

@property (nonatomic, copy, readonly)NSString *name;
@property (nonatomic, readonly)MOPAppearance *appearance;
@property (nonatomic, readonly)MOPPowerstats *powerstats;
@property (nonatomic, readonly)MOPImage *imageURL;
@property (nonatomic, readonly)MOPBiography *biography;

- (instancetype)initWithName:(NSString *)name
                  appearance:(MOPAppearance *)appearance
                  powerstats:(MOPPowerstats *)powerstats
                    imageURL:(MOPImage *)imageURL
                   biography:(MOPBiography *)biography;
;

@end

@interface MOPCharacter (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)dictionary;

@end

NS_ASSUME_NONNULL_END
