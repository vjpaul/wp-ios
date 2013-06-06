//
//  WBDBrowserViewController.m
//  Wordpressio
//
//  Created by Bram Plessers on 06/06/13.
//  Copyright (c) 2013 Bram Plessers. All rights reserved.
//

#import "WBDBrowserViewController.h"

@interface WBDBrowserViewController ()

@end

@implementation WBDBrowserViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.webView = [[UIWebView alloc] init];
        self.webView.backgroundColor = [UIColor yellowColor];
    }
    return self;
}

- (void) viewWillAppear:(BOOL)animated;
{
    [super viewWillAppear:animated];
    self.webView.frame = self.view.frame;
    [self.view addSubview:self.webView];
}

- (void) setPost:(NSObject *)post;
{
    _post = post;
    [self.webView loadHTMLString:[_post valueForKey:@"content"] baseURL:[NSURL URLWithString:@""]];
//    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[_post valueForKey:@"url"]]]];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
