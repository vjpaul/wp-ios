//
//  WBDAppDelegate.h
//  Wordpressio
//
//  Created by Bram Plessers on 06/06/13.
//  Copyright (c) 2013 Bram Plessers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WBDPostsViewController.h"

@interface WBDAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) WBDPostsViewController *postsViewController;


@end
