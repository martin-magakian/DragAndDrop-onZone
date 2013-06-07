//
//  ContentReceiverView.m
//  DragAndDrop
//
//  Created by martin on 06/06/2013.
//  Copyright (c) 2013 doduck.com. All rights reserved.
//

#import "ContentReceiverView.h"

@implementation ContentReceiverView

@synthesize content;

-(void) setContent:(UIView *)_content{
    [content release];
    content = [_content retain];
    content.frame = CGRectMake(self.frame.size.width/2-content.frame.size.width/2,
                               self.frame.size.height/2-content.frame.size.height/2,
                               content.frame.size.width,
                               content.frame.size.height);
    [self addSubview:content];
}

-(CGRect)getContentFrame{
    return CGRectMake(self.frame.origin.x + content.frame.origin.x,
                      self.frame.origin.y + content.frame.origin.y,
                      content.frame.size.width,
                      content.frame.size.height);
}

-(CGPoint) getContentPadding{
    return CGPointMake(content.frame.origin.x,
                       content.frame.origin.y);
}

@end
