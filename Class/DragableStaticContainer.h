//
//  DragableStaticController.h
//  DragAndDrop
//
//  Created by martin on 06/06/2013.
//  Copyright (c) 2013 doduck.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DragableView.h"
#import "StaticView.h"

@interface DragableStaticContainer : NSObject

@property(retain, nonatomic) DragableView *dragableView;
@property(retain, nonatomic) StaticView *staticView;

-(id)initWithDragable:(DragableView *)_dragableView andStatic:(StaticView *)_staticView;

@end
