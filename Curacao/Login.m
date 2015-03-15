//
//  Login.m
//  Curacao
//
//  Created by Sitanshu Joshi on 3/14/15.
//  Copyright (c) 2015 Ebiz Intel Solution Pvt Ltd. All rights reserved.
//

#import "Login.h"


@implementation Login

@dynamic message;
@dynamic nodeAuth;
@dynamic success;

+(RKEntityMapping *)objectMappingForLogin:(OPPCodeType)OppCodeType {
    RKEntityMapping* mapping = [RKEntityMapping mappingForEntityForName:@"Login" inManagedObjectStore:[[AppDelegate appDelegate] rkMOS]];
    
    mapping.setDefaultValueForMissingAttributes = TRUE;
    if (OppCodeType == AUTH) {
        [mapping addAttributeMappingsFromDictionary:@{
                                                      @"success" : @"success",
                                                      @"message" : @"message",
                                                      @"NodeAuth" : @"nodeAuth",
                                                      }];
    }
    return mapping;
}


@end
