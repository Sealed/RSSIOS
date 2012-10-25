//
//  RootViewController.m
//  FisrtStepRSS
//
//  Created by Admin on 20/10/2012.
//  Copyright (c) 2012 Vadim Glushko. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()


@end

@implementation RootViewController
{
    UITableView *_tableView;
    UITextField *textFieldFeed;
    UITextField *textFieldURL;
    }
@synthesize data;
@synthesize dataURL;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    textFieldFeed = [[UITextField alloc] initWithFrame:CGRectMake(12.0, 50.0, 260.0, 25.0)];
    textFieldFeed.placeholder = @"Feeds";
    textFieldFeed.text= @"";
    [textFieldFeed setBackgroundColor:[UIColor whiteColor]];
    
    textFieldURL = [[UITextField alloc] initWithFrame:CGRectMake(12.0, 80.0, 260.0, 25.0)];
    textFieldURL.placeholder = @"URL";
    textFieldURL.text=@"http://";
    [textFieldURL setBackgroundColor:[UIColor whiteColor]];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    self.data = [NSMutableArray arrayWithObjects:@"test1",@"test2",@"test3", nil];
    self.dataURL = [NSMutableArray arrayWithObjects:@"http://test1.ru",@"http://test2.com",@"http://111.com", nil];
    UIBarButtonItem *edit =[[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemEdit
    target:self
    action:@selector(editing)] autorelease];
    self.navigationItem.rightBarButtonItem = edit;  
   
    
    [self.view addSubview:_tableView];
    
    
	// Do any additional setup after loading the view.
}

- (void)editing {
    [self->_tableView setEditing:!self->_tableView.editing animated:YES];
}
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
- (void)tableView:(UITableView *)tableView
moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath 
      toIndexPath:(NSIndexPath *)destinationIndexPath 
{ 
    [data exchangeObjectAtIndex:sourceIndexPath.row withObjectAtIndex:destinationIndexPath.row];
}
- (UITableViewCellEditingStyle)tableView:(UITableView *)TableView
           editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath 
{
    if (indexPath.row == 0) {
        return UITableViewCellEditingStyleInsert;
    } else {
        return UITableViewCellEditingStyleDelete;
    }
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{    
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [data count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    //Поиск ячейки
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    //Если ячейка не найдена
    if (cell == nil) {
        //Создание ячейки        
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];

    }
    
    cell.textLabel.text = [data objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = [dataURL objectAtIndex:indexPath.row];
    return cell;
}

-(void)Alert
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle: @"Enter new feed"
                                                        message:@"Give your full name                                                                     |"
                                                        delegate:self
                                                        cancelButtonTitle:@"Cancel"
                                                        otherButtonTitles:@"OK", nil];
   
    [alertView addSubview:textFieldFeed];
    [alertView addSubview:textFieldURL];
    [alertView show];
    [alertView release];    
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    // the user clicked one of the OK/Cancel buttons
    if (buttonIndex == 0){
        
        
    }
    else
    {        
        [data insertObject:textFieldFeed.text atIndex:0];
        [dataURL insertObject:textFieldURL.text atIndex:0];
        [_tableView reloadData];
        textFieldFeed.text = @"";
        textFieldURL.text = @"http://";
    }
}

- (void)tableView:(UITableView *)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle 
forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
         
        [data removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] 
                         withRowAnimation:UITableViewRowAnimationFade];
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        [self Alert];           
        
            //[data insertObject:textField.text atIndex:0];
            //[tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                       // withRowAnimation:UITableViewRowAnimationFade];
    }
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
