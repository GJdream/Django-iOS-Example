//
//  ViewController.h
//  DemoiOS
//
//  Created by Mark Glagola on 3/2/13.
//  Copyright (c) 2013 Mark Glagola. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
    IBOutlet UITableView *tableView;
}

@end
