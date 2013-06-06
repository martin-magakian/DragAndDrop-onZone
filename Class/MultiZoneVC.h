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

@interface MultiZoneVC : UIViewController{
    UIView *bgView;
    NSArray *zoneRects;
    NSArray *zoneViews;
}

-(id)initWithZones:(NSArray *)_zonesRect withBg:(UIView *)_bgView;
-(ZoneView *) inAZone:(DragableView *) dragableView;

@end
