//
//  Product.h
//  Curacao
//
//  Created by Sitanshu Joshi on 3/23/15.
//  Copyright (c) 2015 Ebiz Intel Solution Pvt Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Product : NSObject

@property (nonatomic, retain) NSString *entity_id;
@property (nonatomic, retain) NSString *type_id;
@property (nonatomic, retain) NSString *processor;
@property (nonatomic, retain) NSString *memory;
@property (nonatomic, retain) NSString *screensize;
@property (nonatomic, retain) NSString *sku;
@property (nonatomic, retain) NSString *hardrive;
@property (nonatomic, retain) NSString *model;
@property (nonatomic, retain) NSString *dimension;
@property (nonatomic, retain) NSString *activation_information;
@property (nonatomic, retain) NSString *description;
@property (nonatomic, retain) NSString *in_depth;
@property (nonatomic, retain) NSString *meta_keyword;
@property (nonatomic, retain) NSString *short_description;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *meta_title;
@property (nonatomic, retain) NSString *meta_description;
@property (nonatomic) float regular_price_with_tax;
@property (nonatomic) float regular_price_without_tax;
@property (nonatomic) float final_price_with_tax;
@property (nonatomic) float final_price_without_tax;
@property (nonatomic, retain) NSString *is_saleable;
@property (nonatomic, retain) NSString *image_url;
@property (nonatomic, retain) NSString *computer_manufacturers;

@end
