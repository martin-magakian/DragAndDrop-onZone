//
//  DragableListVC.h
//  DragAndDrop
//
//  Created by martin on 05/06/2013.
//  Copyright (c) 2013 doduck.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DragableView.h"

@interface DragableListVC : UIViewController<DragableViewEvent>{
    NSArray* dragableItems;
    UIScrollView *scroll;
    id<DragableViewEvent> delegate;
}

-(id)initWithDragableItem:(NSArray *)_dragableItems withDelegate:(id<DragableViewEvent>)_delegate;
-(void)createScrollWithDragableItems;
-(BOOL)isInList:(DragableView *) dragableView;

@end
