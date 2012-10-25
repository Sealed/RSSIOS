//
//  CTable.m
//  FisrtStepRSS
//
//  Created by Admin on 23/10/2012.
//  Copyright (c) 2012 Vadim Glushko. All rights reserved.
//

#import "CTable.h"

@interface CTable ()


@end

@implementation CTable{NSMutableArray *mass;}
@synthesize data;
@synthesize alertView;
@synthesize delegat;


- (id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style title:(NSMutableArray *)title pubdate:(NSMutableArray *)pubdate
{    
    self = [super initWithFrame:frame style:style];
    self.dataSource = self;
    self.delegate = self;
    alertView =[[DDAlertPrompt alloc] initWithTitle:@"Feed" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitle:@"OK"];
    data =[[CData alloc] init];
    data.data = [NSMutableArray arrayWithArray:title];
    data.dataURL = [NSMutableArray arrayWithArray:pubdate];
    alertView.delegate = self;

    if (self) {
        // Custom initialization
    }
    return self;
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)editing {
    [self setEditing:!self.editing animated:YES];
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
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [data.data count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if (cell == nil) {
               
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
        
    }
    
    cell.textLabel.text = [data.data objectAtIndex:indexPath.row];
    cell.detailTextLabel.text =[data.dataURL objectAtIndex:indexPath.row];
   
    return cell;
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0){
        
        
    }
    else
    {
        [self addSomethink];
    }
}

-(void)addSomethink
{
    [data.data insertObject:alertView.plainTextField.text atIndex:0];
    [data.dataURL insertObject:alertView.secretTextField.text atIndex:0];
    alertView.plainTextField.text = nil;
    alertView.secretTextField.text = @"http://";
    [self reloadData];
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [data.data removeObjectAtIndex:indexPath.row];
        [data.dataURL removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        [alertView show];
    }   
}

// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    [data.data exchangeObjectAtIndex:fromIndexPath.row withObjectAtIndex:toIndexPath.row];
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [delegat InBrowser:indexPath];
    
}

@end
