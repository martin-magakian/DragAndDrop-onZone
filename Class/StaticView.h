//
//  StaticView.h
//  DragAndDrop
//
//  Created by martin on 06/06/2013.
//  Copyright (c) 2013 doduck.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContentReceiverView.h"
#import "DragableView.h"

@interface StaticView : ContentReceiverView

@property(retain, nonatomic) DragableView *dragableView;
@property(retain, nonatomic) id<StaticViewEvent> delegate;

@end