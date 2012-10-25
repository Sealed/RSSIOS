//
//  ParserData.m
//  FisrtStepRSS
//
//  Created by Admin on 25/10/2012.
//  Copyright (c) 2012 Vadim Glushko. All rights reserved.
//

#import "ParserData.h"

@implementation ParserData

@synthesize feedTitle;
@synthesize feedPubDate;
@synthesize feedURL;

-(id)init
{
    self.feedURL =[NSMutableArray array];
    self.feedPubDate =[NSMutableArray array];
    self.feedTitle = [NSMutableArray array];
    return self;
}

@end
