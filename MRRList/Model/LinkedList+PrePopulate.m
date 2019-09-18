//
//  LinkedList+PrePopulate.m
//  MRRList
//
//  Created by K Y on 9/17/19.
//  Copyright © 2019 K Y. All rights reserved.
//

#import "LinkedList+PrePopulate.h"

@implementation LinkedList (PrePopulate)

- (void)incrementallyFillWithSize:(NSInteger)size {
    if (size < 1) { return; }
    
    // build head
    ListNode *head = [[ListNode alloc] init];
    head.val = 1;
    ListNode *curr = head;
    
    // build the rest of the node
    for (int i = 2; i <= size; i++) {
        ListNode *newNode = [[ListNode alloc] init];
        newNode.val = i;
        curr.next = newNode;
        curr = curr.next;
        [newNode release];
    }
    self.head = head;
    [head release];
}

@end
