//
//  ListNode.m
//  MRRList
//
//  Created by K Y on 9/17/19.
//  Copyright © 2019 K Y. All rights reserved.
//

#import "ListNode.h"

@implementation ListNode

- (void)dealloc {
    printf("Did destroy node with value %ld\n", (long)self.val);
    
    // list nodes will release its next node in the link
    [_next release];
    _next = nil;
    [super dealloc];
}

@end
