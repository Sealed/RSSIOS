//
//  CTable.h
//  FisrtStepRSS
//
//  Created by Admin on 23/10/2012.
//  Copyright (c) 2012 Vadim Glushko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CAlert.h"
#import "CData.h"
@protocol MyProtocolTable<NSObject>
@optional
- (void)InBrowser:(NSIndexPath *)indexPath;
@end


@interface CTable : UITableView <UIAlertViewDelegate,UITableViewDelegate, UITableViewDataSource>
{
    id<MyProtocolTable>delegat;
    CData *data;
    DDAlertPrompt *alertView;
}
@property (nonatomic, retain)id<MyProtocolTable>delegat;
@property (nonatomic, retain)CData *data;
@property (nonatomic, retain)DDAlertPrompt *alertView;

-(void)addSomethink;
-(void)editing;
- (id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style title:(NSMutableArray *)title pubdate:(NSMutableArray *)pubdate;

@end
