//
//  RootViewController.h
//  FisrtStepRSS
//
//  Created by Admin on 20/10/2012.
//  Copyright (c) 2012 Vadim Glushko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController {
    NSMutableArray *data;
    NSMutableArray *dataURL;
}
@property (nonatomic, retain) NSMutableArray *data;
@property (nonatomic, retain) NSMutableArray *dataURL;


@end
