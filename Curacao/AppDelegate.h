//
//  AppDelegate.h
//  Curacao
//
//  Created by Sitanshu Joshi on 3/3/15.
//  Copyright (c) 2015 Ebiz Intel Solution Pvt Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <RestKit/RestKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

+(AppDelegate *)appDelegate;

#pragma CoreData
/**
 *   Core Data Objects Declaration
 *   Properties for Core Data
 */
@property (strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
#pragma RestKit
/**
 *  RestKit Initialization for Core Mapping Context Object Declaration
 */
@property (nonatomic, strong) NSManagedObjectContext *nsManegedObjectContext;
@property (nonatomic, strong) RKManagedObjectStore *rkMOS;
@property (nonatomic, strong) RKObjectManager *rkObjectManager;
/**
 *  RKObjectManager - Mapping Object Declaration
 */
@property (nonatomic, strong) RKObjectManager *rkomForLogin;
@property (nonatomic, strong) RKObjectManager *rkomForGeneralObject;
@property (nonatomic, strong) RKObjectManager *rkomForCategory;

@property (nonatomic, strong) NSArray *arrayForCategories;

-(void)getChildrenItems:(NSArray *)arrayOfCat;

@end

