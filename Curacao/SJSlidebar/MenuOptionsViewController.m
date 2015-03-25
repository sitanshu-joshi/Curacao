//
//  MenuOptionsViewController.m
//  SportzCal
//
//  Created by Sitanshu Joshi on 1/28/15.
//  Copyright (c) 2015 Sitanshu Joshi. All rights reserved.

#import "MenuOptionsViewController.h"
#import "CustomSlideViewController.h"
@interface MenuOptionsViewController ()

@end


@implementation MenuOptionsViewController
@synthesize tableForCategory;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dictForMaintainInsertDeleteRows = [NSMutableDictionary new];
    
    self.lblName.layer.cornerRadius = 5.0;
    self.imgViewForProfile.layer.cornerRadius = (self.imgViewForProfile.frame.size.width/2);
    self.viewForCityButton.layer.cornerRadius = (self.viewForCityButton.frame.size.width/2);
    self.viewForLogoutButton.layer.cornerRadius = (self.viewForLogoutButton.frame.size.width/2);
    self.viewForNewsButton.layer.cornerRadius = (self.viewForNewsButton.frame.size.width/2);
    self.viewForProfileButton.layer.cornerRadius = (self.viewForProfileButton.frame.size.width/2);
}

-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    [self setUpUserInterface];
//    [self init];
  
}
- (void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UITableView Delegate 

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    Categories *cate = [[AppDelegate appDelegate].arrayForCategories objectAtIndex:section];
    return cate.name;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [AppDelegate appDelegate].arrayForCategories.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 45.0;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger rowCount = 0;
    Categories *cate = [[AppDelegate appDelegate].arrayForCategories objectAtIndex:section];
    rowCount = [cate.children allObjects].count;
    
//    NSArray *ar = [dictForMaintainInsertDeleteRows valueForKey:[NSString stringWithFormat:@"%ld",(long)section]];
//    for (int i =0; i < ar.count; i++) {
//        Categories *cat = [[cate.children allObjects] objectAtIndex:(int)ar];
//        rowCount = rowCount + [cat.children allObjects].count;
//    }
    
    return rowCount;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    static NSString *ParentCellIdentifier = @"ParentCell";
//    static NSString *ChildCellIdentifier = @"ChildCell";
//    
//    BOOL isChild =
//    currentExpandedIndex > -1
//    && indexPath.row > currentExpandedIndex
//    && indexPath.row <= currentExpandedIndex + [[subItems objectAtIndex:currentExpandedIndex] count];          UITableViewCell *cell;
//    if (isChild) {
//        cell = [tableView dequeueReusableCellWithIdentifier:ChildCellIdentifier];
//    } else {
//        cell = [tableView dequeueReusableCellWithIdentifier:ParentCellIdentifier];
//    }
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ParentCellIdentifier];
//    }
//    if (isChild) {
//        Categories *row  = [[subItems objectAtIndex:currentExpandedIndex] objectAtIndex:indexPath.row - currentExpandedIndex - 1];
//        cell.textLabel.text = row.name;
//    } else {
//        NSInteger topIndex = (currentExpandedIndex > -1 && indexPath.row > currentExpandedIndex) ? indexPath.row - [[subItems objectAtIndex:currentExpandedIndex] count] : indexPath.row;
//        
//        Categories *row = [topItems objectAtIndex:topIndex];
//        
//        cell.textLabel.text = row.name;
//        cell.detailTextLabel.text = @"";
//    }
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCell_Identifier_Category];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCell_Identifier_Category];
    }
    Categories *cat = [[AppDelegate appDelegate].arrayForCategories objectAtIndex:indexPath.section];
    Categories *row = [[cat.children allObjects] objectAtIndex:indexPath.row];
    
    cell.textLabel.text = row.name;
    
    return cell;
}

#pragma mark Data source
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    BOOL isChild =
//    currentExpandedIndex > -1
//    && indexPath.row > currentExpandedIndex
//    && indexPath.row <= currentExpandedIndex + [[subItems objectAtIndex:currentExpandedIndex] count];
//    if (isChild) {
//        NSLog(@"A child was tapped, do what you will with it");
//        return;
//    }
//    
//    [tableView beginUpdates];
//    if (currentExpandedIndex == indexPath.row) {
//        [self collapseSubItemsAtIndex:currentExpandedIndex];
//        currentExpandedIndex = -1;
//    } else {
//        BOOL shouldCollapse = currentExpandedIndex > -1;
//        
//        if (shouldCollapse) {
//            [self collapseSubItemsAtIndex:currentExpandedIndex];
//        }
//        
//        currentExpandedIndex = (shouldCollapse && indexPath.row > currentExpandedIndex) ? indexPath.row - [[subItems objectAtIndex:currentExpandedIndex] count] : indexPath.row;
//        
//        [self expandItemAtIndex:currentExpandedIndex];
//    }
//    
//    [tableView endUpdates];
    
    
    
    Categories *cat = [[AppDelegate appDelegate].arrayForCategories objectAtIndex:indexPath.section];
    Categories *row = [[cat.children allObjects] objectAtIndex:indexPath.row];
    NSLog(@"%@",row.name);
    NSLog(@"%@",row.category_id);
    selectedCat = row;
    [self performSegueWithIdentifier:kPush_To_Product sender:nil];
    
//    NSArray *newRows = [row.children allObjects];
//    if (newRows.count >= 1) {
//        NSMutableArray *arr = [[NSMutableArray alloc] initWithArray:[dictForMaintainInsertDeleteRows valueForKey:[NSString stringWithFormat:@"%ld",(long)indexPath.section]]];
//        [arr addObject:[NSString stringWithFormat:@"%ld",(long)indexPath.row]];
//        [dictForMaintainInsertDeleteRows setValue:arr forKey:[NSString stringWithFormat:@"%ld",(long)indexPath.section]];
//        NSMutableArray *indexPaths = [NSMutableArray array];
//        for (int i = 0; i < newRows.count; i++) {
//            [indexPaths addObject:[NSIndexPath indexPathForRow:indexPath.row+i inSection:indexPath.section]];
//        }
//        
//        // tell the table view to update (at all of the inserted index paths)
//        [tableView beginUpdates];
//        [tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationTop];
//        [tableView endUpdates];
//    } else {
//        
//    }
}

#pragma mark Add SubCategory
- (void)expandItemAtIndex:(int)index {
    NSMutableArray *indexPaths = [NSMutableArray new];
    NSArray *currentSubItems = [subItems objectAtIndex:index];
    int insertPos = index + 1;
    for (int i = 0; i < [currentSubItems count]; i++) {
        [indexPaths addObject:[NSIndexPath indexPathForRow:insertPos++ inSection:0]];
    }
    [tableForCategory insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
    [tableForCategory scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:YES];
    
}

- (void)collapseSubItemsAtIndex:(int)index {
    NSMutableArray *indexPaths = [NSMutableArray new];
    for (int i = index + 1; i <= index + [[subItems objectAtIndex:index] count]; i++) {
        [indexPaths addObject:[NSIndexPath indexPathForRow:i inSection:0]];
    }
    [tableForCategory deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
    ;
}
- (id)init {
    self = [super init];
    
    if (self) {
        topItems = [NSMutableArray new];
        for (int i = 0; i < [AppDelegate appDelegate].arrayForCategories.count; i++) {
            Categories *cate = [[AppDelegate appDelegate].arrayForCategories objectAtIndex:i];
            [topItems addObject:cate];
        }
        subItems = [NSMutableArray new];
        currentExpandedIndex = -1;
        
        for (int i = 0; i < [topItems count]; i++) {
            [subItems addObject:[self addSubItem:[topItems objectAtIndex:i]]];
        }
    }
    return self;
}

-(NSArray *)addSubItem:(Categories *)cat {
    NSMutableArray *items = [[NSMutableArray alloc] initWithArray:cat.children.allObjects];
    
    return items;
}
#pragma mark Navigation Part
- (void) prepareForSegue: (UIStoryboardSegue *) segue sender: (id) sender {
    if ([segue isKindOfClass: [CustomSlideViewControllerSegue class]] ) {
        CustomSlideViewControllerSegue *swSegue = (CustomSlideViewControllerSegue*) segue;
        
        swSegue.performBlock = ^(CustomSlideViewControllerSegue* rvc_segue, UIViewController* svc, UIViewController* dvc) {
            
            UINavigationController* navController = (UINavigationController*)self.revealViewController.frontViewController;
            [navController setViewControllers: @[dvc] animated: NO ];
            [self.revealViewController setFrontViewPosition: FrontViewPositionLeft animated: YES];
        };
    } else if([segue.identifier isEqualToString:kPush_To_Product]) {
        ProductListViewController *productList = segue.destinationViewController;
        productList.category = selectedCat;
    }
}

-(void)setUpUserInterface{
//    self.lblName.text = [AppUserInfo sharedAppUserInfo].userName;
//    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:kFBProfilePicURL,[AppUserInfo sharedAppUserInfo].userId]];
//    [self.imgViewForProfile setImageWithURL:url placeholderImage:[UIImage imageNamed:@"profile_pic"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType) {
//                            }];
    self.imgViewForProfile.layer.cornerRadius = (self.imgViewForProfile.frame.size.width/2);
    self.imgViewForProfile.layer.masksToBounds = YES;
}
@end
