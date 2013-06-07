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
    NSArray* dragableStaticContainers;
    UIScrollView *scroll;
    id<DragableViewEvent> delegate;
}

-(id)initWithDragableStaticContainers:(NSArray *)_dragableItems withDelegate:(id<DragableViewEvent>)_delegate;
-(void)createScrollWithDragableItems;
-(BOOL)isInList:(DragableView *) dragableView;
-(CGRect) positionInScrollViewForMotherView:(StaticView *)staticView;
@end
