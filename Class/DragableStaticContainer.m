//
//  DragableStaticController.m
//  DragAndDrop
//
//  Created by martin on 06/06/2013.
//  Copyright (c) 2013 doduck.com. All rights reserved.
//

#import "DragableStaticContainer.h"

@implementation DragableStaticContainer

@synthesize dragableView,staticView;

-(id)initWithDragable:(DragableView *)_dragableView andStatic:(StaticView *)_staticView{
    self = [self init];
    if(self){
        self.dragableView = _dragableView;
        self.staticView = _staticView;
    }
    return self;
}

@end
