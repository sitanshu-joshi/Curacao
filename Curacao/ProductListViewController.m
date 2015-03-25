//
//  ProductListViewController.m
//  Curacao
//
//  Created by Sitanshu Joshi on 3/25/15.
//  Copyright (c) 2015 Ebiz Intel Solution Pvt Ltd. All rights reserved.
//

#import "ProductListViewController.h"

@interface ProductListViewController ()

@end

@implementation ProductListViewController
@synthesize category;
@synthesize collectionForProduct;

- (void)viewDidLoad {
    [super viewDidLoad];
    arrayForCollection = [[NSMutableArray alloc] init];
    dictForKeys = [[NSMutableDictionary alloc] init];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"hi");
    [self getProducts];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

#pragma mark Collection View Delegate
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return arrayForCollection.count;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCell_Identifier_Product forIndexPath:indexPath];
    
    Product *product = [arrayForCollection objectAtIndex:indexPath.row];
    
    UILabel *lbl =(UILabel *)[cell viewWithTag:kCell_Product_name];
    lbl.text = product.name;
    
    lbl =(UILabel *)[cell viewWithTag:kCell_Product_price];
    lbl.text = [NSString stringWithFormat:@"$ %f",product.final_price_with_tax];
    
    UIImageView *imgMedia = (UIImageView *)[cell viewWithTag:kCell_Product_img];
    imgMedia.image = nil;
    NSString *strFileName = [[product.image_url componentsSeparatedByString:@"/"] lastObject];
    if([product.image_url length]>0){
        if([[FileUtility utility] checkFileIsExistOnDocumentDirectoryFolder:[[[FileUtility utility] documentDirectoryPath] stringByAppendingString:kDD_Images] withFileName:strFileName]){
            imgMedia.image = [UIImage imageWithContentsOfFile:[[[FileUtility utility] documentDirectoryPath] stringByAppendingString:[NSString stringWithFormat:@"%@/%@",kDD_Images,strFileName]]];
        }
    }
    
    return cell;
}

#pragma mark Get Rest API
-(void)getProducts {
    [[[AppDelegate appDelegate].rkomForGeneralObject HTTPClient] setDefaultHeader:@"NodeAuth" value:[[NSUserDefaults standardUserDefaults] valueForKey:kNS_UD_Token]];
    [[AppDelegate appDelegate].rkomForGeneralObject getObjectsAtPath:kResource_ProductList parameters:nil success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
        NSLog(@"%@",operation.HTTPRequestOperation.responseString);
        
    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error.description);
        
        NSString *strResponse = operation.HTTPRequestOperation.responseString;
        NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:[strResponse dataUsingEncoding:NSUTF8StringEncoding] options:0 error:NULL];
        NSArray *array = [jsonObject allKeys];
        for (int i= 0 ; i < array.count; i++) {
            NSDictionary *dict = [jsonObject valueForKey:[array objectAtIndex:i]];
            Product *product = [[Product alloc] init];
            
            [product setValuesForKeysWithDictionary:dict];
            [arrayForCollection addObject:product];
        }
        [self downloadPostImages:arrayForCollection];
         [collectionForProduct reloadData];
    }];
   
}

-(void)downloadPostImages:(NSMutableArray *)array {
    for (int iForElse = 0; iForElse<[array count]; iForElse++) {
        @autoreleasepool {
            Product *product = [array objectAtIndex:iForElse];
            NSString *strFileName = [[product.image_url componentsSeparatedByString:@"/"] lastObject];
            if([product.image_url length]>0){
                if(![[FileUtility utility] checkFileIsExistOnDocumentDirectoryFolder:[[[FileUtility utility] documentDirectoryPath] stringByAppendingString:kDD_Images] withFileName:strFileName]){
                    IconDownloader *iconDownloader;
                    if (iconDownloader == nil) {
                        iconDownloader = [[IconDownloader alloc] init];
                        iconDownloader.strIconURL = product.image_url;
                        [iconDownloader setCompletionHandler:^(UIImage *image){
//                            NSData *data = UIImagePNGRepresentation(image);
                            NSData *data = UIImageJPEGRepresentation(image, 1.0);
                            
                            [[FileUtility utility] createFile:strFileName atFolder:[[[FileUtility utility] documentDirectoryPath] stringByAppendingString:kDD_Images] withData:data];
                            [collectionForProduct reloadData];
                        }];
                        [iconDownloader startDownload];
                    }
                }
            }
        }
    }
}


@end
