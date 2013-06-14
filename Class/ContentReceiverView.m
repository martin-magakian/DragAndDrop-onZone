//
//  ContentReceiverView.m
//  DragAndDrop
//
//  Created by martin on 06/06/2013.
//  Copyright (c) 2013 doduck.com. All rights reserved.
//

#import "ContentReceiverView.h"

@implementation ContentReceiverView

@synthesize content,bgContent;

-(void) setContent:(UIView<ScalableView>*)_content{
    [content release];
    content = [_content retain];
    content.frame = CGRectMake(self.frame.size.width/2-content.frame.size.width/2,
                               self.frame.size.height/2-content.frame.size.height/2,
                               content.frame.size.width,
                               content.frame.size.height);
    [self addSubview:content];
}

-(void)setBgContent:(UIView<EnableDisable,ScalableView> *)_bgContent{
    [bgContent release];
    bgContent = [_bgContent retain];
    [self addSubview:bgContent];
    [bgContent selected:NO];
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

-(void)resizeScale:(CGFloat)scale{
    [bgContent resizeScale:scale];
    [content resizeScale:scale];
}

@end
