//
//  DragableZoneVC.m
//  DragAndDrop
//
//  Created by martin on 05/06/2013.
//  Copyright (c) 2013 doduck.com. All rights reserved.
//

#import "MultiZoneVC.h"


@implementation MultiZoneVC

-(id)initWithZones:(NSArray *)_zonesRect withBg:(UIView *)_bgView delegate:(id<ZoneEvent>)_delegate{
    self = [super init];
    if(self){        
        bgView = [_bgView retain];
        zoneRects = [_zonesRect retain];
        delegate = [_delegate retain];
    }
    return self;
}

-(void) viewDidLoad{
    [super viewDidLoad];
    
    passView = [[PassthroughView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    passView.backgroundColor = [UIColor brownColor];
    self.view = passView;
    
    zoneViews = [self createZonesView];
    
    [self.view addSubview:bgView];
    [self addZonesView];
    [self addTapGesture];
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
        zone.delegate = delegate;
        zone.motherView = self.view;
        zone.backgroundColor = [UIColor blueColor];
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

-(void) addTapGesture{
    UITapGestureRecognizer *touchOnView = [[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapUpInside)] autorelease];
    
    [touchOnView setNumberOfTapsRequired:1];
    [touchOnView setNumberOfTouchesRequired:1];
    
    [passView addGestureRecognizer:touchOnView];
}

-(void)tapUpInside{
    NSLog(@"bg zone tapped");
}

@end
