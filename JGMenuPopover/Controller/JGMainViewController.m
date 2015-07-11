//
//  JGMainViewController.m
//  JGMenuPopover
//
//  Created by JJetGu on 15-6-17.
//  Copyright (c) 2015年 Free. All rights reserved.
//

#import "JGMainViewController.h"
#import "JGMenuPopover.h"

#define MENU_POPOVER_FRAME  CGRectMake(8, 54, 140, 88)
#define MENU_LEFTPOPOVER_FRAME  CGRectMake(320 - 148, 54, 140, 88)

@interface JGMainViewController ()<JGMenuPopoverDelegate>

@property(nonatomic,strong) JGMenuPopover *menuPopover;
@property(nonatomic,strong) NSArray *menuItems;

@end

@implementation JGMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.menuItems = [NSArray arrayWithObjects:@"MenuItem_One", @"MenuItem_Se", nil];}

- (IBAction)leftDropAction:(id)sender {
    [self.menuPopover dismissMenuPopover];
    
    self.menuPopover = [[JGMenuPopover alloc] initWithFrame:MENU_POPOVER_FRAME menuItems:self.menuItems isLeft:YES];
    self.menuPopover.menuPopoverDelegate = self;
    [self.menuPopover showInView:self.view.window];
}


- (IBAction)rightDropAction:(id)sender {
    [self.menuPopover dismissMenuPopover];
    
    self.menuPopover = [[JGMenuPopover alloc] initWithFrame:MENU_LEFTPOPOVER_FRAME menuItems:self.menuItems isLeft:NO];
    
    self.menuPopover.menuPopoverDelegate = self;
    [self.menuPopover showInView:self.view.window];
}

#pragma mark -
#pragma mark MLKMenuPopoverDelegate

- (void)menuPopover:(JGMenuPopover *)menuPopover didSelectMenuItemAtIndex:(NSInteger)selectedIndex
{
    [self.menuPopover dismissMenuPopover];
    
    NSString *title = [NSString stringWithFormat:@"good,%@ selected.",[self.menuItems objectAtIndex:selectedIndex]];
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
    [alertView show];
}

@end
