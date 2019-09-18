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
    _listCountLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _listCountLabel.textAlignment = NSTextAlignmentCenter;
    _listCountLabel.font = font;
    _pushListButton = [[UIButton alloc] initWithFrame:CGRectZero];
    [_pushListButton setTitle:@"PUSH" forState:UIControlStateNormal];
    [_pushListButton setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    _pushListButton.backgroundColor = UIColor.blueColor;
    _pushListButton.titleLabel.font = font;
    [_pushListButton addTarget:self action:@selector(pushListAction:) forControlEvents:UIControlEventTouchUpInside];
    _popListButton = [[UIButton alloc] initWithFrame:CGRectZero];
    [_popListButton setTitle:@"POP" forState:UIControlStateNormal];
    [_popListButton setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    _popListButton.backgroundColor = UIColor.redColor;
    _popListButton.titleLabel.font = font;
    [_popListButton addTarget:self action:@selector(popListAction:) forControlEvents:UIControlEventTouchUpInside];
    _listCountLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _pushListButton.translatesAutoresizingMaskIntoConstraints = NO;
    _popListButton.translatesAutoresizingMaskIntoConstraints = NO;
    [view addSubview:_listCountLabel];
    [view addSubview:_pushListButton];
    [view addSubview:_popListButton];
    NSArray *constraints = @[
                             [_listCountLabel.topAnchor constraintEqualToAnchor:view.topAnchor],
                             [_listCountLabel.leadingAnchor constraintEqualToAnchor:view.leadingAnchor],
                             [_listCountLabel.trailingAnchor constraintEqualToAnchor:view.trailingAnchor],
                             [_listCountLabel.bottomAnchor constraintEqualToAnchor:_pushListButton.topAnchor],
                             [_listCountLabel.bottomAnchor constraintEqualToAnchor:_popListButton.topAnchor],
                             [_popListButton.bottomAnchor constraintEqualToAnchor:view.bottomAnchor],
                             [_pushListButton.bottomAnchor constraintEqualToAnchor:view.bottomAnchor],
                             [_pushListButton.leadingAnchor constraintEqualToAnchor:view.leadingAnchor],
                             [_pushListButton.trailingAnchor constraintEqualToAnchor:_popListButton.leadingAnchor],
                             [_popListButton.trailingAnchor constraintEqualToAnchor:view.trailingAnchor],
                             [_pushListButton.heightAnchor constraintEqualToConstant:100.0],
                             [_popListButton.heightAnchor constraintEqualToConstant:100.0],
                             [_pushListButton.widthAnchor constraintEqualToAnchor:_popListButton.widthAnchor]
    ];
    [NSLayoutConstraint activateConstraints:constraints];
}

- (void)pushListAction:(UIButton *)sender {
    LinkedList *newList = [[LinkedList alloc] init];
    NSInteger ranNum = arc4random_uniform(10) + 1;
    [newList incrementallyFillWithSize:ranNum];
    [listStack addObject:newList];
    [newList release];
    printf("did push new linked list in of size %ld\n", (long)ranNum);
    _listCountLabel.text = [NSString stringWithFormat:@"%ld", (long)listStack.count];
}

- (void)popListAction:(UIButton *)sender {
    if ([listStack count] == 0) {
        printf("the stack is empty\n");
        return;
    }
    [listStack removeLastObject];
    printf("did pop linked list off\n");
    _listCountLabel.text = [NSString stringWithFormat:@"%ld", (long)listStack.count];
}

@end
