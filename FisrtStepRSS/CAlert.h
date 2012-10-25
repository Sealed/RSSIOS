//
//  CAlert.h
//  FisrtStepRSS
//
//  Created by Admin on 22/10/2012.
//  Copyright (c) 2012 Vadim Glushko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DDAlertPrompt : UIAlertView <UITableViewDelegate, UITableViewDataSource> {
    
    
	UITableView *tableView_;
	UITextField *plainTextField_;
	UITextField *secretTextField_;
}

@property(nonatomic, retain) UITableView *tableView;
@property(nonatomic, retain) UITextField *plainTextField;
@property(nonatomic, retain) UITextField *secretTextField;


- (id)initWithTitle:(NSString *)title delegate:(id /*<UIAlertViewDelegate>*/)delegate cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitle:(NSString *)otherButtonTitles;

@end