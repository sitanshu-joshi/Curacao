//
//  Categories.m
//  Curacao
//
//  Created by Sitanshu Joshi on 3/25/15.
//  Copyright (c) 2015 Ebiz Intel Solution Pvt Ltd. All rights reserved.
//

#import "Categories.h"
#import "Categories.h"


@implementation Categories

@dynamic category_id;
@dynamic is_active;
@dynamic level;
@dynamic name;
@dynamic parent_id;
@dynamic position;
@dynamic children;

+(RKEntityMapping *)objectMappingForCategory:(OPPCodeType)oppcode {
    RKEntityMapping* mapping = [RKEntityMapping mappingForEntityForName:@"Categories" inManagedObjectStore:[[AppDelegate appDelegate] rkMOS]];
    
    mapping.setDefaultValueForMissingAttributes = TRUE;
    if (oppcode == CATEGORY_LIST) {
        [mapping addAttributeMappingsFromDictionary:@{
                                                      @"category_id" : @"category_id",
                                                      @"is_active" : @"is_active",
                                                      @"level" : @"level",
                                                      @"parent_id" : @"parent_id",
                                                      @"position" : @"position",
                                                      @"name" : @"name",
                                                      }];
        
        [mapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"children" toKeyPath:@"children" withMapping:mapping]];
        
    }
    return mapping;
}

@end
