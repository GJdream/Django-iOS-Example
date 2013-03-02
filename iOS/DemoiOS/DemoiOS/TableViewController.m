//
//  ViewController.m
//  DemoiOS
//
//  Created by Mark Glagola on 3/2/13.
//  Copyright (c) 2013 Mark Glagola. All rights reserved.
//

#import "TableViewController.h"
#import "AFNetworking.h"
#import "Post.h"

@interface TableViewController () {
    NSFetchedResultsController *frc;
    UIRefreshControl *refreshControl;
}

@end

@implementation TableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self action:@selector(reloadData) forControlEvents:UIControlEventValueChanged];
    self.refreshControl = refreshControl;
    
    frc = [Post MR_fetchAllSortedBy:@"published" ascending:NO withPredicate:nil groupBy:nil delegate:self];
}

- (void) reloadData {
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://127.0.0.1:8000/api/post/?format=json"]];
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        NSLog(@"JSON Recievied");
        NSArray *objects = [JSON objectForKey:@"objects"];
        [objects enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            [Post postFromJSON:obj];
        }];
        [self.refreshControl endRefreshing];
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        NSLog(@"Connection Failed");
        [self.refreshControl endRefreshing];
    }];
    [operation start];
}

#pragma mark - UITableView delegate/datasource methods
- (UITableViewCell*) tableView:(UITableView *)_tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellID = @"PostCell";
    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:CellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellID];
    }
    
    Post *post = [frc objectAtIndexPath:indexPath];
    cell.textLabel.text = post.title;
    
    return cell;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    id  sectionInfo = [[frc sections] objectAtIndex:section];
    return [sectionInfo numberOfObjects];
}

#pragma mark - NSFetchedResultsControllerDelegate methods
- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    //should be more sophisticated then just calling reloadData
    //but for simplicity ....
    [self.tableView reloadData];
}

@end
