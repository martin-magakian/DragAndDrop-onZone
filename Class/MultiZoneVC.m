//
//  DragableZoneVC.m
//  DragAndDrop
//
//  Created by martin on 05/06/2013.
//  Copyright (c) 2013 doduck.com. All rights reserved.
//

#import "MultiZoneVC.h"

@implementation MultiZoneVC

-(id)initWithZones:(NSArray *)_zonesRect withBg:(UIView *)_bgView{
    self = [super init];
    if(self){
        bgView = [_bgView retain];
        zoneRects = [_zonesRect retain];
    }
    return self;
}

-(void) viewDidLoad{
    [super viewDidLoad];
    zoneViews = [self createZonesView];
    
    [self.view addSubview:bgView];
    [self addZonesView];
}

-(void) addZonesView{
    for(UIView *zone in zoneViews){
        [self.view addSubview:zone];
    }
}

-(NSArray *) createZonesView{
    NSMutableArray *liZoneViews = [[NSMutableArray alloc] initWithCapacity:zoneRects.count];
    for(NSValue *zoneVal in zoneRects){
        CGRect zoneRect = [zoneVal CGRectValue];
        ZoneView *zone = [[ZoneView alloc] initWithFrame:zoneRect];
        zone.motherView = self.view;
        zone.backgroundColor = [UIColor blueColor];
        zone.alpha = 0.3;
        [liZoneViews addObject:zone];
    }
    return liZoneViews;
}


-(ZoneView *) inAZone:(DragableView *) dragableView{
    
    CGRect content = [dragableView getContentFrame];
    
    for(ZoneView *zoneView in zoneViews){
        CGRect posInMother = [zoneView positionInMother];
        
        if(CGRectIntersectsRect(posInMother,content)){
            return zoneView;
        }
        
    }
    return nil;
}


@end
