//
//  ParserData.h
//  FisrtStepRSS
//
//  Created by Admin on 25/10/2012.
//  Copyright (c) 2012 Vadim Glushko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ParserData : NSObject
{ @private    
    NSMutableArray *feedTitle;
    NSMutableArray *feedPubDate;
    NSMutableArray *feedURL;    
}
@property(nonatomic,retain) NSMutableArray *feedTitle;
@property(nonatomic,retain) NSMutableArray *feedPubDate;
@property(nonatomic,retain) NSMutableArray *feedURL;

-(id)init;

@end
