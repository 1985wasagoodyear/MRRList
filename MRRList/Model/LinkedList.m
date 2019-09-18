//
//  LinkedList.m
//  MRRList
//
//  Created by K Y on 9/17/19.
//  Copyright © 2019 K Y. All rights reserved.
//

#import "LinkedList.h"

@interface LinkedList () {
    ListNode *_head;
}

@end

@implementation LinkedList

- (void)setHead:(ListNode *)head {
    [_head release];
    _head = head;
    [head retain];
}

- (ListNode *)head {
    return _head;
}

- (void)dealloc {
    // go through the list, get all values within the list
    NSMutableArray *vals = [[NSMutableArray alloc] init];
    ListNode *curr = [self head];
    while (curr != nil) {
        ListNode *this = curr;
        [vals addObject:@(this.val)];
        curr = this.next;
    }
    
    // display our values within the list
    printf("Did destroy linked list of elements %s\n", vals.description.UTF8String);
    
    // clean up the temporary variable(s) made
    [vals release];
    
    // release the head (which will release all its nodes, cascading the release of the list)
    [_head release];
    _head = nil;
    
    [super dealloc];
}

@end
