//
//  DragDropVC.h
//  DragAndDrop
//
//  Created by martin on 05/06/2013.
//  Copyright (c) 2013 doduck.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DragableListVC.h"
#import "MultiZoneVC.h"

@interface DragDropManagerVC: UIViewController<DragableViewEvent>{
    
    DragableListVC *dList;
    NSArray* dragableItems;
    
    MultiZoneVC *dZone;
    NSArray *zones;
    UIView *zoneView;
    
    ZoneView *lastOverZone;
}

-(id)initWithDragableItem:(NSArray *)_dragableItems withZones:(NSArray *)_zones forZoneView:(UIView *)_zoneView;

@end
