//
//  MOPImage.m
//  SuperHeroC
//
//  Created by Maxwell Poffenbarger on 1/30/20.
//  Copyright © 2020 Maxwell Poffenbarger. All rights reserved.
//

#import "MOPImage.h"

static NSString * const imageKey = @"md";

@implementation MOPImage

- (instancetype)initWithImageURL:(NSString *)imageURL
{
    self = [super init];
    if (self)
    {
        _imageURL = imageURL;
    }
    return self;
}
@end

@implementation MOPImage (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)dictionary
{
    NSString *imageURL = dictionary[imageKey];
    
    return [self initWithImageURL:imageURL];
}
@end
