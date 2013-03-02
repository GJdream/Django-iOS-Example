//
//  Post.m
//  DemoiOS
//
//  Created by Mark Glagola on 3/2/13.
//  Copyright (c) 2013 Mark Glagola. All rights reserved.
//

#import "Post.h"


@implementation Post

@dynamic title;
@dynamic content;
@dynamic published;
@dynamic objectId;

+ (id) postFromJSON:(id)JSON {
 
    Post *post = [[Post MR_findAllWithPredicate:[NSPredicate predicateWithFormat:@"objectId == %@", [JSON objectForKey:@"id"]]] lastObject];
    
    if (!post) {
        post = [Post MR_createEntity];
        post.title = [JSON objectForKey:@"title"];
        post.content = [JSON objectForKey:@"content"];
        post.objectId = [JSON objectForKey:@"id"];
        
        //parse date
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setLocale:[NSLocale currentLocale]];
        [formatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSSSS"];
        NSString *dateString = [JSON objectForKey:@"published_date"];
        post.published = [formatter dateFromString:dateString];
    }
    
    
    return post;
}



@end
