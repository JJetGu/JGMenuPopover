//
//  JGMenuPopover.h
//  JGMenuPopover
//
//  Created by JJetGu on 15-6-17.
//  Copyright (c) 2015年 Free. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JGMenuPopover;

@protocol JGMenuPopoverDelegate <NSObject>

- (void)menuPopover:(JGMenuPopover *)menuPopover didSelectMenuItemAtIndex:(NSInteger)selectedIndex;

@end

@interface JGMenuPopover : UIView<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,assign) id<JGMenuPopoverDelegate> menuPopoverDelegate;

- (id)initWithFrame:(CGRect)frame menuItems:(NSArray *)aMenuItems isLeft:(BOOL)left;
- (void)showInView:(UIView *)view;
- (void)dismissMenuPopover;
- (void)layoutUIForInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation;

@end
