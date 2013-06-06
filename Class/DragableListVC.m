//
//  DragableListVC.m
//  DragAndDrop
//
//  Created by martin on 05/06/2013.
//  Copyright (c) 2013 doduck.com. All rights reserved.
//

#import "DragableListVC.h"

#define PADDING_LEFT_ITEM 10
#define PADDING_BOTTOM_ITEM 20
@implementation DragableListVC


-(id)initWithDragableItem:(NSArray *)_dragableItems withDelegate:(id<DragableViewEvent>)_delegate{
    self = [super init];
    if(self){
        dragableItems = [_dragableItems retain];
        delegate = [_delegate retain];
    }
    return self;
}

-(void)createScrollWithDragableItems{
    [scroll removeFromSuperview];
    
    scroll = [[UIScrollView alloc] initWithFrame:self.view.frame];
    scroll.backgroundColor = [UIColor lightGrayColor];
    
    int y = 0;
    for(DragableView *item in dragableItems){
        item.frame = CGRectMake(PADDING_LEFT_ITEM,
                                y,
                                item.frame.size.width,
                                item.frame.size.height);
        [scroll addSubview:item];
        
        item.delegate = self;
        
        y += item.frame.size.height + PADDING_BOTTOM_ITEM;
    }
    
    scroll.contentSize = CGSizeMake(self.view.frame.size.width, y - PADDING_BOTTOM_ITEM);
    
    self.view = scroll;
}

-(BOOL)isInList:(DragableView *) dragableView{
    for(DragableView *item in dragableItems){
        if(item == dragableView){
            NSArray *subViews = [scroll subviews];
            for(UIView *sub in subViews){
                if(sub == dragableView){
                    return YES;
                }
            }
        }
    }
    return NO;
}


-(void) isDragingStart:(DragableView *) dragableView{
    scroll.scrollEnabled = NO;
    [delegate isDragingStart:dragableView];
}


-(void) isDragingEnd:(DragableView *) dragableView{
    scroll.scrollEnabled = YES;
    [delegate isDragingEnd:dragableView];
}

-(void) isDragingMoved:(DragableView *) dragableView{
    [delegate isDragingMoved:dragableView];
}


-(void)dealloc{
    [delegate release];
    [dragableItems release];
    [super dealloc];
}

@end
