//
//  MOPCharacterController.h
//  SuperHeroC
//
//  Created by Maxwell Poffenbarger on 1/30/20.
//  Copyright © 2020 Maxwell Poffenbarger. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"
@class MOPCharacter;

NS_ASSUME_NONNULL_BEGIN

@interface MOPCharacterController : NSObject

+ (void)fetchCharacterInfo:(NSString *) searchTerm completion:(void (^) (MOPCharacter * _Nullable))completion;

+ (void)fetchCharacterImage:(MOPCharacter *)character completion:(void (^) (UIImage * _Nullable))completion;

@end

NS_ASSUME_NONNULL_END
