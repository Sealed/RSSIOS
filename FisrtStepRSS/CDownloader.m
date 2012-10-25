//
//  CDownloader.m
//  FisrtStepRSS
//
//  Created by Admin on 25/10/2012.
//  Copyright (c) 2012 Vadim Glushko. All rights reserved.
//

#import "CDownloader.h"

@implementation CDownloader
@synthesize rssData;
@synthesize delegate;
@synthesize url;
@synthesize theRequest;
@synthesize theConnection;

- (id)init
{    
    //self.url = [NSURL URLWithString:@"http://imaladec.com/rss.php"];
    self.url = [NSURL URLWithString:@"http://tproger.ru/rss/feed"];
    
    //self.url = [NSURL URLWithString:@"http://feeds.feedburner.com/TheAppleBlog"];
    self.theRequest=[NSURLRequest requestWithURL:url
                                              cachePolicy:NSURLRequestUseProtocolCachePolicy
                                          timeoutInterval:60.0];
    
    self.theConnection=[[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    if (theConnection) {
        self.rssData = [NSMutableData data];
    } else {
        NSLog(@"Connection failed");
    }      
   
    return self;
}
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [rssData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {    
    SEL selector = @selector(start);
	if (delegate && [delegate respondsToSelector:selector]) {
		[delegate performSelector:selector];
	}
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"%@", error);
}


@end
