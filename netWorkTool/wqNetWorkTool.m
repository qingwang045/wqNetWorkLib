//
//  wqNetWorkTool.m
//  wqTestAll
//
//  Created by WQ on 2019/3/18.
//  Copyright © 2019年 WQ. All rights reserved.
//

#import "wqNetWorkTool.h"
#import <AFNetworking/AFNetworking.h>
#define HTTP_TIME_OUT_NORMAL    60
#define APP_VERSION                        ([[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"])

#pragma mark - 2018年4月新的*.shanghaionstar.com 域名证书
static NSString * const newcerBase64 = @"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";

#pragma mark - 2018年8月新的*.shanghaionstar.com 域名证书
static NSString * const newcer201808 = @"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";

#pragma mark - 2018年6月新的*.onstar.com.cn 域名证书
static NSString * const newNginxBase64 = @"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";


@implementation wqNetWorkTool
{
    
    FailureBlock mFailBlock;
    NSInteger operationID;
}

-(instancetype)initWithUrl:(NSString*)url para:(NSString*)para success:(SuccessBlock)success fail:(FailureBlock)failed
{
    if (self = [super init]) {
        AFHTTPRequestSerializer *requestSerializer = [AFHTTPRequestSerializer serializer];
        AFHTTPResponseSerializer *responseSerializer = [AFHTTPResponseSerializer serializer];
        [self setSSLPolicyWithCer:[url hasPrefix:@"https"]];
        NSError *serializationError = nil;
        self.mRequest = [requestSerializer requestWithMethod:@"POST" URLString:url parameters: [para dataUsingEncoding:NSUTF8StringEncoding] error:&serializationError];
        if (success) {
            self.mSuccessBlock = success;
        }
        if (failed) {
            if (serializationError) {
                failed(serializationError.code,@"",serializationError);
            }else
            {
                mFailBlock = failed;
            }
        }
        if (para) {
            [self.mRequest setHTTPBody:[para dataUsingEncoding:NSUTF8StringEncoding]];
        }
        [self initDefaultHeaderValueForRequest:NO];
        self.manager.responseSerializer = responseSerializer;
        self.manager.requestSerializer = requestSerializer;
    }
    return self;
}


-(void)start
{
    if (!_afOperation) {
        _afOperation = [self.manager dataTaskWithRequest:_mRequest
                                          uploadProgress:nil
                                        downloadProgress:nil
                                       completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
                                           NSLog(@"response is %@",response);
                                           //NSInteger statusCode = ((NSHTTPURLResponse *)response).statusCode;
                                           self.mSuccessBlock(response);
                                       }];
    }
    operationID = (NSInteger)[[NSDate date] timeIntervalSince1970] * 1000 + arc4random()%1000;
    [_afOperation resume];
    [self printLog];
}

- (void)setSSLPolicyWithCer:(BOOL) fromCer{
    
    if(true){
        fromCer = NO;
    }
    if(fromCer){
        // 1.设置证书模式
        // allowInvalidCertificates 是否允许无效证书（也就是自建的证书），默认为NO
        // 如果是需要验证自建证书，需要设置为YES
        //validatesDomainName 是否需要验证域名，默认为YES;
        //假如证书的域名与你请求的域名不一致，需把该项设置为NO；如设成NO的话，即服务器使用其他可信任机构颁发的证书，也可以建立连接，这个非常危险，建议打开。
        //置为NO，主要用于这种情况：客户端请求的是子域名，而证书上的是另外一个域名。因为SSL证书上的域名是独立的，假如证书上注册的域名是www.google.com，那么mail.google.com是无法验证通过的；当然，有钱可以注册通配符的域名*.google.com，但这个还是比较贵的。
        //如置为NO，建议自己添加对应域名的校验逻辑。
        
        NSData * cerDataNewCer = [[NSData alloc] initWithBase64EncodedString:newcerBase64 options:0];
        NSData * cerData201808 = [[NSData alloc] initWithBase64EncodedString:newcer201808 options:0];
        NSData *newNginxCer = [[NSData alloc] initWithBase64EncodedString:newNginxBase64 options:0];
        
        self.manager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModePublicKey];
        self.manager.securityPolicy.pinnedCertificates = [[NSSet alloc] initWithObjects:cerDataNewCer, newNginxCer,cerData201808,nil];
    }    else    {
        self.manager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    }
}



- (AFHTTPSessionManager *)manager {
    static AFHTTPSessionManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //必须设置BaseURL，坑。。。
        manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:@"https://xxx.xxx.com"]];
    });
    return manager;;
}


- (void)initDefaultHeaderValueForRequest:(BOOL)isUpload    {
    [_mRequest setTimeoutInterval:HTTP_TIME_OUT_NORMAL];
    [_mRequest setValue:@"zh-CN" forHTTPHeaderField:@"Accept-Language"];
    [_mRequest setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    if (!isUpload) {
        [_mRequest setValue:@"application/json;charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
    }
    [_mRequest setValue:[self clientInfo] forHTTPHeaderField:@"CLIENT-INFO"];
    [_mRequest setValue:@"4C8FA17F-99EE-4230-83C5-A3DB93267B93|INFO466536155|169E72FA200" forHTTPHeaderField:@"CLIENT-TRACE-ID"];

}


- (void)setHttpMethod:(NSString *)httpMethod    {
    [_mRequest setHTTPMethod:httpMethod];
}

- (void)setHttpHeaders:(NSDictionary *)headerDict    {
    NSArray* keyList = [headerDict allKeys];
    for(NSString* key in keyList)    {
        NSString *value = [headerDict objectForKey:key];
        if (key && value) {
            [_mRequest setValue:[headerDict objectForKey:key] forHTTPHeaderField:key];
            [self.manager.requestSerializer setValue:[headerDict objectForKey:key] forHTTPHeaderField:key];
        }
    }
}


-(NSString *)clientInfo
{
    
    //平台_系统版本号_应用版本号_客户端语言_手机类型
    //平台取值：android/iphone/ipad
    //客户端语言取值：zh-CN/en-US
    //手机类型:android具体手机model等信息，ios具体型号
    //例如：
    //android_4.0_31_zh-CN_Galaxy/iphone_9.1_7.0.0_en-US_iphone4/ipad_9.1_5.1.0_zh-CN
    NSString *CLIENT_INFO = [NSString stringWithFormat:@"%@_%f_%@_%@_%@_%@",@"IPHONE_LARGE",[[[UIDevice currentDevice]systemVersion]floatValue], [self getAppVersionCode],@"zh-CN",@"IPHONEX",@"jwA2pFiuJLzdGdDUqc9SzQ=="];
    return CLIENT_INFO;
}

-(NSString *)getAppVersionCode     {
    
    NSArray *array = [APP_VERSION componentsSeparatedByString:@"."];
    NSInteger versionCode = 0;
    if ([array count] > 2) {
        versionCode = [[array objectAtIndex:0] integerValue] * 10000 + [[array objectAtIndex:1] integerValue] * 100 + [[array objectAtIndex:2] integerValue];
    }
    return [NSString stringWithFormat:@"%@%@", @"",@(versionCode)];
}


- (void)printLog    {
    NSLog(@"\n>>>>>> HTTP request [%ld]\nURL [%@]\nMethod [%@]\nHeaders ==>> %@ <<==\nBody ==>> %@ <<===",
             operationID, [_mRequest.URL absoluteString], [_mRequest HTTPMethod],
             [_mRequest allHTTPHeaderFields], [[NSString alloc] initWithData:[_mRequest HTTPBody] encoding:NSUTF8StringEncoding]);
}

@end
