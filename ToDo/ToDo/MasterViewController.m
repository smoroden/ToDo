//
//  MasterViewController.m
//  ToDo
//
//  Created by Zach Smoroden on 2016-05-17.
//  Copyright © 2016 Zach Smoroden. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "Todo.h"
#import "TodoCell.h"
#import "NewTodoView.h"

@interface MasterViewController () <AddTodoDelegate>

@property NSMutableArray *objects;
@property NSArray *todoItems;
@property (nonatomic) NewTodoView *addTodoView;
@property (nonatomic) UIVisualEffectView *blurView;

@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

//    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
//    self.navigationItem.rightBarButtonItem = addButton;
    
    self.objects = [@[[[Todo alloc] initWithTitle:@"Laundry" andDetails:@"No clean clothes" andPriority:4],
                       [[Todo alloc] initWithTitle:@"Make Dinner" andDetails:@"Sweet & Sour Chicken" andPriority:6],
                       [[Todo alloc] initWithTitle:@"Homework" andDetails:@"Much to do" andPriority:1]
                       
                       ] mutableCopy];
    
    
}

- (void)viewWillAppear:(BOOL)animated {
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewTodo:(Todo*)todo {
    if (!self.objects) {
        self.objects = [[NSMutableArray alloc] init];
    }
    [self.objects insertObject:todo atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}
- (IBAction)addNew:(UIBarButtonItem *)sender {
    
    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    self.blurView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    
    self.blurView.frame = self.view.frame;
    
    [self.view addSubview:self.blurView];
    
    UINib *nib = [UINib nibWithNibName:@"NewTodo" bundle:nil];
    
    NewTodoView *newView = [nib instantiateWithOwner:self options:nil][0];
    newView.frame = self.view.bounds;
    newView.delegate = self;
    [self.blurView addSubview:newView];
    
}

-(void)doneWithAdd {
    [self.blurView removeFromSuperview];
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Todo *object = self.objects[indexPath.row];
        DetailViewController *controller = (DetailViewController *)[segue destinationViewController];
        [controller setDetailItem:object];
    } else if ([[segue identifier] isEqualToString:@"showAddTodo"]) {
        
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TodoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    Todo *object = self.objects[indexPath.row];
    cell.titleLabel.text = [object title];
    cell.detailLabel.text = [object detail];
    cell.priorityLabel.text = [NSString stringWithFormat:@"%ld", (long) [object priority]];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

@end