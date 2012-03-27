//
//  NSObject+ReederExtension.m
//  Extention for Reeder 1.1.5
//
//  Created by azur256 on 03/26/11.
//  Copyright 2012 azur256. All rights reserved.
//  Special thanks to moyashi (@hitoriblog), Kazuya Takeshima (@mitukiii)
//

#import "NSResponder+ReederExtension.h"

@implementation NSResponder(ReederExtension)

- (void)viewDidLoadExtention
{
//    NSLog(@"Call viewDidLoadExtention");

    NSString* blogTitle;

    [self viewDidLoadExtention];

    NSButton *button = [[[NSButton alloc] init] autorelease];
    [[[[self textFieldCell:@"ServiceFormText"] input] NSView] addSubview:button];
    [button setKeyEquivalent:@"\r"];
    [button setKeyEquivalentModifierMask:NSCommandKeyMask];
    [button setTarget:self];
    [button setAction:@selector(submit:)];
    
    [self performSelector:@selector(addText:) withObject:@" [SHARE] "];
    [self performSelector:@selector(insertTitle:) withObject:nil];

    blogTitle = [[self performSelector:@selector(data)] performSelector:@selector(srcTitle)];
    if (blogTitle != nil) {
        [self performSelector:@selector(addText:) withObject:@"|"];
        [self performSelector:@selector(addText:) withObject:blogTitle];
    } else {
        NSLog(@"data is nil.");
    }

    [self performSelector:@selector(addText:) withObject:@"☞ "];
    [self performSelector:@selector(insertLink:) withObject:nil];

    return;
}

- (void)__didShortenLinkExtention:(id)arg1
{
    [self __didShortenLinkExtention:arg1];
    [[[self textFieldCell:@"ServiceFormText"] input] setSelectedRange:NSMakeRange(0, 0)];
    
}

@end
