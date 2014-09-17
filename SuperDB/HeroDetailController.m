//
//  HeroDetailController.m
//  SuperDB
//
//  Created by ZengYifei on 14-5-15.
//  Copyright (c) 2014年 ZengYifei. All rights reserved.
//

#import "HeroDetailController.h"
#import "SuperDBEditCell.h"
@interface HeroDetailController ()
@property (strong,nonatomic)NSArray *sections;
@property (strong,nonatomic)UIBarButtonItem * saveButton;
@property (strong,nonatomic)UIBarButtonItem * backButton;
@property (strong,nonatomic)UIBarButtonItem * cancelBUtton;
- (void)cancel;
- (void)save;
@end

@implementation HeroDetailController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        self.view.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSURL * plistURL = [[NSBundle mainBundle]URLForResource:@"HeroDetailConfiguration" withExtension:@"plist"];
    NSDictionary * plist = [NSDictionary dictionaryWithContentsOfURL:plistURL];
    self.sections = [plist valueForKey:@"sections"];
    
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.saveButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(save)];
    
    self.backButton = self.navigationItem.leftBarButtonItem ;
    self.cancelBUtton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancel)];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//#warning Potentially incomplete method implementation.
//    // Return the number of sections.
//    return 0;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//#warning Incomplete method implementation.
//    // Return the number of rows in the section.
//    return 0;
//}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * CellIdentifier =@"SuperDBEditCell";
    SuperDBEditCell * cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
        cell = [[SuperDBEditCell alloc]initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:CellIdentifier];
    //configure th cell...
        NSUInteger sectionIndex = [indexPath section];
        NSUInteger rowIndex = [indexPath row];
        
        NSDictionary * section = [self.sections objectAtIndex:sectionIndex];
        NSArray * rows = [section objectForKey:@"rows"];
        NSDictionary * row = [rows objectAtIndex:rowIndex];
        cell.key = [row objectForKey:@"key"];
        //cell.textLabel.text = [row objectForKey:@"label"];
    
    //NSLog(@"%@",[self.hero valueForKey:[row objectForKey:@"key"]]);
    if (self.hero != NULL) {
        //[self.hero valueForKey:[row objectForKey:@"key"]];
    }
        cell.detailTextLabel.text = [[self.hero valueForKey:[row objectForKey:@"key"]]description];  // hero内容问题
        //cell.detailTextLabel.text = [[row objectForKey:@"key"]description];
    return cell;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleNone;
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated{
    [super setEditing:editing animated:animated];
    self.navigationItem.rightBarButtonItem = (editing) ? self.saveButton : self.editButtonItem;
    self.navigationItem.leftBarButtonItem = (editing) ? self.cancelBUtton : self.backButton;
}

- (void)save{
    [self setEditing:NO animated:YES];
    for(SuperDBEditCell * cell in [self.tableView visibleCells]){
        [self.hero setValue:[cell value] forKey:[cell key]];
    }
    
    NSError * error;
    if (![ self.hero.managedObjectContext save:&error]) {
        NSLog(@"Error saving : %@",[error localizedDescription]);
    }
    [self.tableView reloadData];
}

- (void)cancel{
    [self setEditing:NO animated:YES];
}



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
