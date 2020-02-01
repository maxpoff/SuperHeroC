//
//  MOPCharacterController.m
//  SuperHeroC
//
//  Created by Maxwell Poffenbarger on 1/30/20.
//  Copyright © 2020 Maxwell Poffenbarger. All rights reserved.
//

#import "MOPCharacterController.h"
#import "MOPCharacter.h"
#import "MOPImage.h"

@implementation MOPCharacterController

+ (void)fetchCharacterInfo:(NSString *) searchTerm completion:(void (^)(MOPCharacter * _Nullable))completion
{
    NSDictionary *headers = @{ @"x-rapidapi-host": @"superhero-search.p.rapidapi.com",
                               @"x-rapidapi-key": @"7de0169004msh3749c9f525a2099p182f2ejsn36baeecef662" };
    
    NSURL * baseURL = [NSURL URLWithString: @"https://superhero-search.p.rapidapi.com/"];
    
    NSURLComponents * components = [[NSURLComponents alloc] initWithURL:baseURL resolvingAgainstBaseURL:true];
    
    NSURLQueryItem * heroQueryItem = [[NSURLQueryItem alloc] initWithName:@"hero" value:searchTerm];
    
    components.queryItems = @[heroQueryItem];
    
    NSURL * finalURL = components.URL;
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:finalURL cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10.0];
    
    [request setHTTPMethod:@"GET"];
    [request setAllHTTPHeaderFields:headers];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request
                                                completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error)
        {
            NSLog(@"%@", error);
            completion(nil);
            return;
        }
        
        if (data)
        {
            NSDictionary<NSString *, id> *topLevel = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
            
            MOPCharacter * newCharacter = [[MOPCharacter alloc] initWithDictionary:topLevel];
            
            completion(newCharacter);
        }
    }];
    [dataTask resume];
}

+ (void)fetchCharacterImage:(MOPCharacter *)character completion:(void (^)(UIImage * _Nullable))completion
{
    NSURL * imageURL = [NSURL URLWithString: character.imageURL.imageURL];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:imageURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error)
      {
        
        if (error)
        {
            NSLog(@"%@", error);
            completion(nil);
            return;
        }
        
        if (data)
        {
            UIImage * image = [[UIImage alloc] initWithData:data];
            completion(image);
        }
    }] resume];
}
@end
