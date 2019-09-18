//
//  LinkedList+PrePopulate.h
//  MRRList
//
//  Created by K Y on 9/17/19.
//  Copyright © 2019 K Y. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LinkedList.h"

NS_ASSUME_NONNULL_BEGIN

@interface LinkedList (PrePopulate)

/// size - greater than 0
- (void)incrementallyFillWithSize:(NSInteger)size;

@end

NS_ASSUME_NONNULL_END
