//
//  RootViewController2.m
//  FisrtStepRSS
//
//  Created by Admin on 23/10/2012.
//  Copyright (c) 2012 Vadim Glushko. All rights reserved.
//

#import "RootViewController2.h"

@interface RootViewController2 ()

@end

@implementation RootViewController2
@synthesize tableView;
@synthesize parser;


- (void)viewDidLoad
{
    [super viewDidLoad];   
    parser = [[CParser alloc] init];
    parser.delegate = self;  
    
}

-(void)finishParser
{
    UIBarButtonItem *edit =[[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemEdit
                                                                         target:self
                                                                         action:@selector(editing)] autorelease];
    tableView = [[CTable alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain title:parser.parData.feedTitle pubdate:parser.parData.feedPubDate];
    tableView.delegat = self;
    self.navigationItem.rightBarButtonItem = edit;
    [self.view addSubview:tableView];
}

-(void)InBrowser:(NSIndexPath *)indexPath
{
    NSString *a = [NSString string];
    a = [parser.parData.feedURL objectAtIndex:indexPath.row];    
    SecondViewController *second = [[SecondViewController alloc] initwithurl:a];
    [self.navigationController pushViewController:second animated:YES];    
    
}

-(void)editing
{
    [tableView editing];
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
