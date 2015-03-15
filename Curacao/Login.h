//
//  Login.h
//  Curacao
//
//  Created by Sitanshu Joshi on 3/14/15.
//  Copyright (c) 2015 Ebiz Intel Solution Pvt Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Login : NSManagedObject

@property (nonatomic, retain) NSString * message;
@property (nonatomic, retain) NSString * nodeAuth;
@property (nonatomic, retain) NSNumber * success;

+(RKEntityMapping *)objectMappingForLogin:(OPPCodeType)OppCodeType;

@end
