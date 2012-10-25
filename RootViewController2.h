//
//  RootViewController2.h
//  FisrtStepRSS
//
//  Created by Admin on 23/10/2012.
//  Copyright (c) 2012 Vadim Glushko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CTable.h"
#import "CParser.h"
#import "SecondViewController.h"


@interface RootViewController2 : UIViewController <UITableViewDelegate, UITableViewDataSource,MyProtocolParser,MyProtocolTable>
{
    CTable *tableView;
    CParser *parser;
    
}
@property(nonatomic, retain)CParser *parser;
@property(nonatomic, retain) CTable *tableView;

-(void)finishParser;
-(void)InBrowser:(NSIndexPath *)indexPath;

@end
