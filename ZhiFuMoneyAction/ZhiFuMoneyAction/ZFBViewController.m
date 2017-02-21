//
//  ZFBViewController.m
//  ZhiFuMoneyAction
//
//  Created by huyiyong on 17/2/16.
//  Copyright © 2017年 huyiyong. All rights reserved.
//

#import "ZFBViewController.h"
#import <AlipaySDK/AlipaySDK.h>
#import "Order.h"

@interface ZFBViewController ()

@end

@implementation ZFBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
}

- (NSString *)generateTradeNO
{
    static int kNumber = 15;
    
    NSString *sourceStr = @"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    NSMutableString *resultStr = [[NSMutableString alloc] init];
    srand((unsigned)time(0));
    for (int i = 0; i < kNumber; i++)
    {
        unsigned index = rand() % [sourceStr length];
        NSString *oneStr = [sourceStr substringWithRange:NSMakeRange(index, 1)];
        [resultStr appendString:oneStr];
    }
    return resultStr;
}


- (IBAction)PayClick:(UIButton *)sender {
    
    //将商品信息赋予AlixPayOrder的成员变量
    Order* order = [Order new];
    
    NSString *rsaPrivateKey;
    NSString *rsa2PrivateKey = @"MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCEnlX4H3ohExwtvs+fUDta6QmPhzimvCP8ZYWRPZNiG0DsxrHtQ1VpHwSygUAbM70zAXwjI2YC86DaYSTW9hdR6dp3pZ4JBp0g3bOSzCdq+RbULfqYcQyOkF299XqmFp0tr5O8xHcMyCTx5/WyiQn8wnpkxuofDpizdyllZFTjfYqdO4+SJfQ/X7UupegRE96VVLAw+vSPfyzXzwq/hetWyDIpwcj/Ez0VDKFGNrjy9slI3Wbj6HnR5PnUPuYN5LMEChW3arbpoUszNR7At9JMb1sjlU5zaULYlCjQyFQLKd/kAfzykVzMl63uJakenI7M2Cs/dcAfccqSOhBp3cnbAgMBAAECggEAV3PWOy3+qmrgrSXj4inVSkjcPiKsb/8nN9x2rOVPGGXidYE9eblqTEzhGxlyfb2rqUP0aXOBZLblvrxKv9o+XIz6vOWhBlCvMyofrdEkuT0TGc5ML1R1NFntB0QmofnNon/iy5s+6lXdTwxokFggFubkMSqe3uYQOmB9EtiLxgtivBilUl5JPv/jBNg4K6RmxxD1lbclUYHGcUVC1aOdctkcjqkq9M4S+VY+IFqEuf3kjqFttPZABoZoypiAUFZ9Zzslq0xDw5pjN53+L2tW3j7W1Rk7CaFHBhOP89hEuGzDLcu7DHLlPt3IVqQxVPsexMgtbnEEjYH4idPh69BMeQKBgQDGblYHfQ05gAHIcqeXQaT2sPDzrI00Bfsm0gTGqOpdhODaPfFZsniNP6SoDCVQUA3lWNi92b4NoUTU3q4sy68B/ED9FPXnqX+GXqI9WYccGw5MOXUMqmODIeY5RMsz+p8fKtr6FFIFqCgU0rdKu2zmDkXFeHJwYOF75kqgSUsEHwKBgQCrGAqHInHdNZVSdLag07fw9t3poJ1iLqo8p9l9LjXjBa2y03O7luFJGqzl0tJkn4GDtKbq3EITWulaKjlvIbhQcqZcYU8Zf2UfB2ciyoyvhn87ixTgfzfxCYqHvUWSyef8k+9aoY36WcKNBsQ4Mm6rf91xPGLlCJyIiNRf5HiixQKBgHHLtOp2fK8NCfi6SAImU0RmFMipnBDJnU6WAscq97zKB2khPNgD0b6vUO5OiNeWEWIFoca+qI+IfMDXM2vdI3AwCdUZwCwquEeG3ePxA9rKaVitWsL4tDjvp+gP27jjcX2eRhZEsQUtek72yMbC1aDZbongmUB5TtaPKxzg63RhAoGBAKCbYMaZvuk4c4ODrCwskm7QTmARNawEwilOJwsrZcpGeldzxyBA8hn9wG+9B2MNmDZaTpYJTL1+ia7qFCAON0bNWP0/G1GEFRibimVOXeInDyiF1oMm6QyLOE9TjQvOHMcs13LsVKq9t7NKtsdKEDlNPkIdvXfiLY69Yx7hCZ1BAoGBAKDsWiPU5q4rkD+Y+hg6le+UUPpXQjWmmk5hvdZJZf4iQEo68ssAfLMUD3xw9s3HaUptRS/RtenptsSrxW0bR4Q665ygkI3/Jtai9kh/7iMldO2wFI1KoKn6HHKzgOeQbg+I+/JMO4mu0vpVWxUKPKn6m/JV5UdP7tsCjafVfBKl";
    
    // NOTE: app_id设置
    order.app_id = @"2088111851716894";
    
    // NOTE: 支付接口名称
    order.method = @"alipay.trade.app.pay";
    
    // NOTE: 参数编码格式
    order.charset = @"utf-8";
    
    // NOTE: 当前时间点
    NSDateFormatter* formatter = [NSDateFormatter new];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    order.timestamp = [formatter stringFromDate:[NSDate date]];
    
    // NOTE: 支付版本
    order.version = @"1.0";
    
    // NOTE: sign_type设置
    order.sign_type = @"RSA";
    
    // NOTE: 商品数据
    order.biz_content = [BizContent new];
    order.biz_content.body = @"我是测试数据";
    order.biz_content.subject = @"1";
    order.biz_content.out_trade_no = [self generateTradeNO]; //订单ID（由商家自行制定）
    order.biz_content.timeout_express = @"30m"; //超时时间设置
    order.biz_content.total_amount = [NSString stringWithFormat:@"%.2f", 0.01]; //商品价格
    
    //将商品信息拼接成字符串
    NSString *orderInfo = [order orderInfoEncoded:NO];
    NSString *orderInfoEncoded = [order orderInfoEncoded:YES];
    NSLog(@"orderSpec = %@",orderInfo);
    
    // NOTE: 获取私钥并将商户信息签名，外部商户的加签过程请务必放在服务端，防止公私钥数据泄露；
    //       需要遵循RSA签名规范，并将签名字符串base64编码和UrlEncode
//    id<DataSigner> signer = CreateRSADataSigner(privateKey);
    NSString *signedString = nil;// [signer signString:orderInfo];
//    RSADataSigner* signer = [[RSADataSigner alloc] initWithPrivateKey:((rsa2PrivateKey.length > 1)?rsa2PrivateKey:rsaPrivateKey)];
//    if ((rsa2PrivateKey.length > 1)) {
//        signedString = [signer signString:orderInfo withRSA2:YES];
//    } else {
//        signedString = [signer signString:orderInfo withRSA2:NO];
//    }
    signedString = @"MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCEnlX4H3ohExwtvs+fUDta6QmPhzimvCP8ZYWRPZNiG0DsxrHtQ1VpHwSygUAbM70zAXwjI2YC86DaYSTW9hdR6dp3pZ4JBp0g3bOSzCdq+RbULfqYcQyOkF299XqmFp0tr5O8xHcMyCTx5/WyiQn8wnpkxuofDpizdyllZFTjfYqdO4+SJfQ/X7UupegRE96VVLAw+vSPfyzXzwq/hetWyDIpwcj/Ez0VDKFGNrjy9slI3Wbj6HnR5PnUPuYN5LMEChW3arbpoUszNR7At9JMb1sjlU5zaULYlCjQyFQLKd/kAfzykVzMl63uJakenI7M2Cs/dcAfccqSOhBp3cnbAgMBAAECggEAV3PWOy3+qmrgrSXj4inVSkjcPiKsb/8nN9x2rOVPGGXidYE9eblqTEzhGxlyfb2rqUP0aXOBZLblvrxKv9o+XIz6vOWhBlCvMyofrdEkuT0TGc5ML1R1NFntB0QmofnNon/iy5s+6lXdTwxokFggFubkMSqe3uYQOmB9EtiLxgtivBilUl5JPv/jBNg4K6RmxxD1lbclUYHGcUVC1aOdctkcjqkq9M4S+VY+IFqEuf3kjqFttPZABoZoypiAUFZ9Zzslq0xDw5pjN53+L2tW3j7W1Rk7CaFHBhOP89hEuGzDLcu7DHLlPt3IVqQxVPsexMgtbnEEjYH4idPh69BMeQKBgQDGblYHfQ05gAHIcqeXQaT2sPDzrI00Bfsm0gTGqOpdhODaPfFZsniNP6SoDCVQUA3lWNi92b4NoUTU3q4sy68B/ED9FPXnqX+GXqI9WYccGw5MOXUMqmODIeY5RMsz+p8fKtr6FFIFqCgU0rdKu2zmDkXFeHJwYOF75kqgSUsEHwKBgQCrGAqHInHdNZVSdLag07fw9t3poJ1iLqo8p9l9LjXjBa2y03O7luFJGqzl0tJkn4GDtKbq3EITWulaKjlvIbhQcqZcYU8Zf2UfB2ciyoyvhn87ixTgfzfxCYqHvUWSyef8k+9aoY36WcKNBsQ4Mm6rf91xPGLlCJyIiNRf5HiixQKBgHHLtOp2fK8NCfi6SAImU0RmFMipnBDJnU6WAscq97zKB2khPNgD0b6vUO5OiNeWEWIFoca+qI+IfMDXM2vdI3AwCdUZwCwquEeG3ePxA9rKaVitWsL4tDjvp+gP27jjcX2eRhZEsQUtek72yMbC1aDZbongmUB5TtaPKxzg63RhAoGBAKCbYMaZvuk4c4ODrCwskm7QTmARNawEwilOJwsrZcpGeldzxyBA8hn9wG+9B2MNmDZaTpYJTL1+ia7qFCAON0bNWP0/G1GEFRibimVOXeInDyiF1oMm6QyLOE9TjQvOHMcs13LsVKq9t7NKtsdKEDlNPkIdvXfiLY69Yx7hCZ1BAoGBAKDsWiPU5q4rkD+Y+hg6le+UUPpXQjWmmk5hvdZJZf4iQEo68ssAfLMUD3xw9s3HaUptRS/RtenptsSrxW0bR4Q665ygkI3/Jtai9kh/7iMldO2wFI1KoKn6HHKzgOeQbg+I+/JMO4mu0vpVWxUKPKn6m/JV5UdP7tsCjafVfBKl";
    
    
    // NOTE: 如果加签成功，则继续执行支付
    if (signedString != nil) {
        //应用注册scheme,在AliSDKDemo-Info.plist定义URL types
        NSString *appScheme = @"alisdkdemo";
        
        // NOTE: 将签名成功字符串格式化为订单字符串,请严格按照该格式
        NSString *orderString = [NSString stringWithFormat:@"%@&sign=%@",
                                 orderInfoEncoded, signedString];
        
        // NOTE: 调用支付结果开始支付
        [[AlipaySDK defaultService] payOrder:orderString fromScheme:appScheme callback:^(NSDictionary *resultDic) {
            NSLog(@"reslut = %@",resultDic);
        }];
    }

}



@end
