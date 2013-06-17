//
//  ContentReceiverView.m
//  DragAndDrop
//
//  Created by martin on 06/06/2013.
//  Copyright (c) 2013 doduck.com. All rights reserved.
//

#import "ContentReceiverView.h"

#define MARGIN_BOTTUM_TOP 12

@implementation ContentReceiverView

@synthesize content,bgContent;



-(void) centerContent{
    content.frame = CGRectMake(self.frame.size.width/2-content.frame.size.width/2,
                               self.frame.size.height/2-content.frame.size.height/2,
                               content.frame.size.width,
                               content.frame.size.height);
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

-(void)contentChanged{
    CGRect bgFrame = self.bgContent.frame;
    self.frame = CGRectMake(bgFrame.origin.x,
                            bgFrame.origin.y,
                            bgFrame.size.width,
                            MARGIN_BOTTUM_TOP*2 + content.frame.size.height);
    
    self.bgContent.frame = CGRectMake(bgFrame.origin.x,
                                      bgFrame.origin.y,
                                      bgFrame.size.width,
                                      MARGIN_BOTTUM_TOP*2 + content.frame.size.height);
    [self centerContent];
}

-(void) setContent:(UIView<ScalableView> *)_content{
    [content release];
    content = [_content retain];
    [self contentChanged];

    [self addSubview:content];
}

-(void)resizeScale:(CGFloat)scale{
    [bgContent resizeScale:scale];
    [content resizeScale:scale];
    [self contentChanged];
    [self centerContent];
}

@end
