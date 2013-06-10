//
//  PassthroughView.m
//  DragAndDrop
//
//  Created by martin on 10/06/2013.
//  Copyright (c) 2013 doduck.com. All rights reserved.
//

#import "PassthroughView.h"

@implementation PassthroughView

-(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    
    for (UIView *view in self.subviews) {
        if (!view.hidden && view.userInteractionEnabled && [view pointInside:[self convertPoint:point toView:view] withEvent:event])
            return YES;
    }
    return NO;
}

@end
