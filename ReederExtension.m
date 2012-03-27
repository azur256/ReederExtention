//
//  ReederExtension.m
//  Extention for Reeder 1.1.5
//
//  Created by azur256 on 03/26/12.
//  Copyright 2012 azur256. All rights reserved.
//

#import "ReederExtension.h"
#import "NSObject+Swizzle.h"
#import <objc/runtime.h>

@implementation ReederExtension

+ (void)load
{
    Class class = objc_getClass("ServiceFormController");

    if (class == nil) {
        NSLog(@"class not exists.");
        return;
    }
    
    [class swizzleMethod:@selector(viewDidLoad)
              withMethod:@selector(viewDidLoadExtention)];

    [class swizzleMethod:@selector(__didShortenLink:)
              withMethod:@selector(__didShortenLinkExtention:)];
}

@end
