//
//  CParser.h
//  FisrtStepRSS
//
//  Created by Admin on 25/10/2012.
//  Copyright (c) 2012 Vadim Glushko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CDownloader.h"
#import "ParserData.h"

@protocol MyProtocolParser<NSObject>
@optional
- (void)finishParser;
@end

@interface CParser : NSObject  <NSXMLParserDelegate,MyProtocolDownloader>
{    
    id<MyProtocolParser>delegate;
    ParserData *parData;
    CDownloader *responcedata;
    NSString * currentElement;    
    NSXMLParser *rssParser;
    NSMutableString *currentTitle;
    NSMutableString *currentpubDate;
    NSMutableString *currenturl;
    
}
@property(nonatomic,assign) id<MyProtocolParser>delegate;
@property(nonatomic,retain) NSMutableString *currentTitle;
@property(nonatomic,retain) NSMutableString *currentpubDate;
@property(nonatomic,retain) NSMutableString *currenturl;
@property (nonatomic, retain) ParserData *parData;
@property (nonatomic, retain) NSXMLParser *rssParser;
@property (nonatomic, retain) CDownloader *responcedata;
@property (nonatomic, retain) NSString * currentElement;



-(void)start;
@end
