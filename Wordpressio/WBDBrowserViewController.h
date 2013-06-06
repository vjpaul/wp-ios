//
//  WBDBrowserViewController.h
//  Wordpressio
//
//  Created by Bram Plessers on 06/06/13.
//  Copyright (c) 2013 Bram Plessers. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WBDBrowserViewController : UIViewController

@property (nonatomic,strong) NSObject *post;
@property (nonatomic,strong) UIWebView *webView;

@end
