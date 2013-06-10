//
//  DragableZoneVC.h
//  DragAndDrop
//
//  Created by martin on 05/06/2013.
//  Copyright (c) 2013 doduck.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DragableView.h"
#import "ZoneView.h"
#import "PassthroughView.h"

@interface MultiZoneVC : UIViewController{
    PassthroughView *passView;
    UIView *bgView;
    NSArray *zoneRects;
    NSArray *zoneViews;
    id<ZoneEvent> delegate;
}

-(id)initWithZones:(NSArray *)_zonesRect withBg:(UIView *)_bgView delegate:(id<ZoneEvent>)_delegate;
-(ZoneView *) inAZone:(DragableView *) dragableView;

@end
