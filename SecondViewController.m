//
//  SecondViewController.m
//  FisrtStepRSS
//
//  Created by Admin on 25/10/2012.
//  Copyright (c) 2012 Vadim Glushko. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()


@end

@implementation SecondViewController
@synthesize url;
@synthesize browser;
@synthesize texturl;

-(id)initwithurl:(NSString *)text
{
    self.texturl = [NSString stringWithString:text];
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    browser = [[UIWebView alloc] initWithFrame:self.view.bounds];    
    self.url = [NSURL URLWithString:self.texturl];    
    [self.view addSubview:browser];
    [browser loadRequest:[NSURLRequest requestWithURL:self.url]];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
