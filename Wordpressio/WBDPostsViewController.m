//
//  WBDPostsViewController.m
//  Wordpressio
//
//  Created by Bram Plessers on 06/06/13.
//  Copyright (c) 2013 Bram Plessers. All rights reserved.
//

#import "WBDPostsViewController.h"
#import "WBDHTTPClient.h"
#import "WBDBrowserViewController.h"

@interface WBDPostsViewController ()
{
    
}

@property (nonatomic,strong) WBDHTTPClient *api;

@end

@implementation WBDPostsViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        
        self.api = [WBDHTTPClient sharedClient];
        [self.api postsWithSuccess:^(NSArray *posts) {
            self.posts = posts;
            [self.tableView reloadData];
        } failure:^(NSError *error) {
            NSLog(@"failure");
        }];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.posts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = [[self.posts objectAtIndex:indexPath.row] valueForKey:@"title"];
    cell.detailTextLabel.text = [[self.posts objectAtIndex:indexPath.row] valueForKey:@"url"];
    
    return cell;
}

- (float) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    return 64.f;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    WBDBrowserViewController *browserViewController = [[WBDBrowserViewController alloc] init];
    browserViewController.post = [self.posts objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:browserViewController animated:YES];
}

@end
