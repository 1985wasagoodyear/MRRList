//
//  LinkedList.m
//  MRRList
//
//  Created by K Y on 9/17/19.
//  Copyright © 2019 K Y. All rights reserved.
//

#import "LinkedList.h"

@implementation LinkedList

- (void)dealloc {
    // release all its nodes
    @autoreleasepool {
        NSMutableArray *vals = [[NSMutableArray alloc] init];
        ListNode *curr = [self head];
        while (curr != nil) {
            ListNode *this = curr;
            [vals addObject:@(this.val)];
            // NSLog(@"%@", vals);
            curr = this.next;
            [this release];
        }
        printf("Did destroy linked list of elements %s\n", vals.description.UTF8String);
        [vals release];
        [curr release];
    }
    [super dealloc];
}

@end
