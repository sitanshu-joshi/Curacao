//
//  Categories.h
//  Curacao
//
//  Created by Sitanshu Joshi on 3/25/15.
//  Copyright (c) 2015 Ebiz Intel Solution Pvt Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Enum.h"

@class Categories;

@interface Categories : NSManagedObject

@property (nonatomic, retain) NSString * category_id;
@property (nonatomic, retain) NSString * is_active;
@property (nonatomic, retain) NSString * level;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * parent_id;
@property (nonatomic, retain) NSString * position;
@property (nonatomic, retain) NSSet *children;
@end

@interface Categories (CoreDataGeneratedAccessors)

- (void)addChildrenObject:(Categories *)value;
- (void)removeChildrenObject:(Categories *)value;
- (void)addChildren:(NSSet *)values;
- (void)removeChildren:(NSSet *)values;

+(RKEntityMapping *)objectMappingForCategory:(OPPCodeType)oppcode;

@end
