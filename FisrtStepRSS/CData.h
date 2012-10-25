//
//  CData.h
//  FisrtStepRSS
//
//  Created by Admin on 23/10/2012.
//  Copyright (c) 2012 Vadim Glushko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CData : NSObject
{    
    NSMutableArray *data;
    NSMutableArray *dataURL;
}
@property (nonatomic, retain) NSMutableArray *data;
@property (nonatomic, retain) NSMutableArray *dataURL;

//-(id)init;




@end
