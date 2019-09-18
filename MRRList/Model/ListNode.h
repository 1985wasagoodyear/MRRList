//
//  ListNode.h
//  MRRList
//
//  Created by K Y on 9/17/19.
//  Copyright © 2019 K Y. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ListNode : NSObject

@property (nonatomic) NSInteger val;
@property (nonatomic, retain) ListNode * _Nullable next;

@end

NS_ASSUME_NONNULL_END
