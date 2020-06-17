//
//  SharedFileList.h
//  NoiseBuddy
//
//  Created by Dima Kalachniuk on 09/03/2020.
//  Copyright © 2020 com.dkcompany.xcodeprojects. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SharedFileList : NSObject

+ (instancetype)sessionLoginItems;

@property (nonatomic, readonly) NSSet<NSURL *> *items;

@property (nonatomic, copy, nullable) void(^changeHandler)(SharedFileList *);

- (BOOL)containsItem:(NSURL *)url;
- (void)addItem:(NSURL *)url;
- (void)removeItem:(NSURL *)url;

@end

NS_ASSUME_NONNULL_END
