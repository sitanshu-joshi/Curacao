//
//  ProductListViewController.h
//  Curacao
//
//  Created by Sitanshu Joshi on 3/25/15.
//  Copyright (c) 2015 Ebiz Intel Solution Pvt Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Categories.h"

@interface ProductListViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource>{
    
    NSMutableArray *arrayForCollection;
    NSMutableDictionary *dictForKeys;
}

@property (nonatomic, strong) Categories *category;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionForProduct;

@end
