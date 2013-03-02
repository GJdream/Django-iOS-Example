//
//  Post.h
//  DemoiOS
//
//  Created by Mark Glagola on 3/2/13.
//  Copyright (c) 2013 Mark Glagola. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Post : NSManagedObject

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * content;
@property (nonatomic, retain) NSDate * published;
@property (nonatomic, retain) NSNumber * objectId;

+ (id) postFromJSON:(id)JSON;

@end
