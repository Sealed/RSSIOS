//
//  CDownloader.h
//  FisrtStepRSS
//
//  Created by Admin on 25/10/2012.
//  Copyright (c) 2012 Vadim Glushko. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol MyProtocolDownloader<NSObject>
@optional
- (void)start;
@end


@interface CDownloader : NSObject
{
    @private
    id<MyProtocolDownloader>delegate;
    NSMutableData *rssData;
    NSURL *url;
    NSURLRequest *theRequest;
    NSURLConnection *theConnection;
}
@property (nonatomic,retain) NSURLConnection *theConnection;
@property (nonatomic,retain) NSURLRequest *theRequest;
@property (nonatomic, retain) NSURL *url;
@property (nonatomic, retain) NSMutableData *rssData;
@property (nonatomic, assign)id <MyProtocolDownloader> delegate;

- (id)init;

@end
