//
//  wqNetWorkTool.h
//  wqTestAll
//
//  Created by WQ on 2019/3/18.
//  Copyright © 2019年 WQ. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^SuccessBlock)(id responseStr);
typedef void (^FailureBlock)(NSInteger statusCode, NSString *responseStr, NSError *error);


@interface wqNetWorkTool : NSObject

@property(nonatomic,retain)NSMutableURLRequest *mRequest;
@property (nonatomic ,strong) NSURLSessionDataTask *afOperation;
@property (nonatomic,copy)SuccessBlock mSuccessBlock;

-(instancetype)initWithUrl:(NSString*)url para:(NSString*)para success:(SuccessBlock)success fail:(FailureBlock)failed;
-(void)setHead:(NSString*)para;
-(void)setHttpMethod:(NSString *)httpMethod;
-(void)setHttpHeaders:(NSDictionary *)headerDict;
-(void)start;


@end

NS_ASSUME_NONNULL_END
