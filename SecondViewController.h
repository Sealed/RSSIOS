//
//  SecondViewController.h
//  FisrtStepRSS
//
//  Created by Admin on 25/10/2012.
//  Copyright (c) 2012 Vadim Glushko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController
{
    NSURL *url;
    UIWebView *browser;
    NSString *texturl;
    
}
@property(nonatomic,retain) NSString *texturl;
@property(nonatomic,retain) UIWebView *browser;
@property(nonatomic,retain) NSURL *url;

-(id)initwithurl:(NSString *)text;



@end
