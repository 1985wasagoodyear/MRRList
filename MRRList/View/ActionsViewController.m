//
//  ActionsViewController.m
//  MRRList
//
//  Created by K Y on 9/17/19.
//  Copyright © 2019 K Y. All rights reserved.
//

#import "ActionsViewController.h"
#import "LinkedList+PrePopulate.h"

@interface ActionsViewController () {
    NSMutableArray *listStack;
}

@property (nonatomic) UILabel *listCountLabel;
@property (nonatomic) UIButton *pushListButton;
@property (nonatomic) UIButton *popListButton;

@end

@implementation ActionsViewController

#pragma mark - Lifecycle Methods

- (instancetype)init {
    self = [super init];
    if (self) {
        listStack = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *view = self.view;
    view.backgroundColor = UIColor.whiteColor;
    UIFont *font = [UIFont systemFontOfSize:50.0];
    
    // create label
    _listCountLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _listCountLabel.textAlignment = NSTextAlignmentCenter;
    _listCountLabel.font = font;
    _listCountLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    // create push button
    _pushListButton = [[UIButton alloc] initWithFrame:CGRectZero];
    [_pushListButton setTitle:@"PUSH" forState:UIControlStateNormal];
    [_pushListButton setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    _pushListButton.backgroundColor = UIColor.blueColor;
    _pushListButton.titleLabel.font = font;
    [_pushListButton addTarget:self action:@selector(pushListAction:) forControlEvents:UIControlEventTouchUpInside];
    _pushListButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    // create pop button
    _popListButton = [[UIButton alloc] initWithFrame:CGRectZero];
    [_popListButton setTitle:@"POP" forState:UIControlStateNormal];
    [_popListButton setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    _popListButton.backgroundColor = UIColor.redColor;
    _popListButton.titleLabel.font = font;
    [_popListButton addTarget:self action:@selector(popListAction:) forControlEvents:UIControlEventTouchUpInside];
    _popListButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    // add them into the view
    [view addSubview:_listCountLabel];
    [view addSubview:_pushListButton];
    [view addSubview:_popListButton];
    
    // build our constraints
    NSArray *constraints = @[
                             // label sits on the top, above both buttons
                             [_listCountLabel.topAnchor constraintEqualToAnchor:view.topAnchor],
                             [_listCountLabel.leadingAnchor constraintEqualToAnchor:view.leadingAnchor],
                             [_listCountLabel.trailingAnchor constraintEqualToAnchor:view.trailingAnchor],
                             [_listCountLabel.bottomAnchor constraintEqualToAnchor:_pushListButton.topAnchor],
                             [_listCountLabel.bottomAnchor constraintEqualToAnchor:_popListButton.topAnchor],
                             
                             // push button is on the left
                             [_pushListButton.bottomAnchor constraintEqualToAnchor:view.bottomAnchor],
                             [_pushListButton.leadingAnchor constraintEqualToAnchor:view.leadingAnchor],
                             [_pushListButton.trailingAnchor constraintEqualToAnchor:_popListButton.leadingAnchor],
                             
                             // pop button is on the right
                             [_popListButton.bottomAnchor constraintEqualToAnchor:view.bottomAnchor],
                             [_popListButton.trailingAnchor constraintEqualToAnchor:view.trailingAnchor],
                             
                             // button occupy the same height and width
                             [_pushListButton.heightAnchor constraintEqualToConstant:100.0],
                             [_popListButton.heightAnchor constraintEqualToConstant:100.0],
                             [_pushListButton.widthAnchor constraintEqualToAnchor:_popListButton.widthAnchor]
    ];
    [NSLayoutConstraint activateConstraints:constraints];
    
    // allocs made here are handled within autorelease-pool
}

#pragma mark - Custom Action Methods

- (void)pushListAction:(UIButton *)sender {
    // build a new list and populate it
    LinkedList *newList = [[LinkedList alloc] init];
    NSInteger ranNum = arc4random_uniform(10) + 1;
    [newList incrementallyFillWithSize:ranNum];
    
    // add it to our stack
    [listStack addObject:newList];
    printf("did push new linked list of size %ld\n", (long)ranNum);
    
    // update our label
    NSString *newText = [NSString stringWithFormat:@"%ld", (long)listStack.count];
    _listCountLabel.text = newText;
    
    // cleanup LinkedList alloc
    [newList release];
}

- (void)popListAction:(UIButton *)sender {
    // only pop if the stack can be popped
    if ([listStack count] == 0) {
        printf("the stack is empty\n");
        return;
    }
    [listStack removeLastObject];
    printf("did pop linked list off\n");
    
    // update our label
    NSString *newText = [NSString stringWithFormat:@"%ld", (long)listStack.count];
    _listCountLabel.text = newText;
}

@end
