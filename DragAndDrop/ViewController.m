//
//  ViewController.m
//  DragAndDrop
//
//  Created by martin on 05/06/2013.
//  Copyright (c) 2013 doduck.com. All rights reserved.
//

#import "ViewController.h"
#import "DragableListVC.h"
#import "DragableView.h"
#import "StaticView.h"
#import "DragableStaticContainer.h"
#import "EnableDisableView.h"
#import "LabelScalableView.h"
#import "ImageScalableView.h"

@implementation ViewController




- (void)viewDidLoad
{
    [super viewDidLoad];
    [self displayView];
}

-(void) displayView{
    
    NSArray *dragableStaticControllers = [self dragableStaticControllers];
    NSArray *zones = [self createZonesViewAndLinkTo:dragableStaticControllers];
    
    dd = [[DragDropManagerVC alloc] initWithDragableStaticControllers:dragableStaticControllers withZones:zones forZoneView:[self createZoneView]];
    dd.view.frame = CGRectMake(20, 100, 700, 500);
    dd.view.backgroundColor = [UIColor yellowColor];

    [self.view addSubview:dd.view];
}


-(DragableStaticContainer *)createDragableStaticContainerText:(NSString *) text{
    CGFloat w = [UIImage imageNamed:@"top-normal.png"].size.width;
    CGRect viewRect = CGRectMake(0, 0, w, 50);
    
    DragableView *dragable1 = [[[DragableView alloc] initWithFrame:viewRect] autorelease];
    LabelScalableView *content1 = [[[LabelScalableView alloc] initWithFrame:CGRectMake(0, 0, 56, 25)] autorelease];
    content1.text = text;
    [content1 fitCurrentFrame];
    dragable1.bgContent = [[[EnableDisableView alloc] initWithFrame:viewRect isEnable:YES] autorelease];
    dragable1.content = content1;
    
    StaticView *static1 = [[[StaticView alloc] initWithFrame:viewRect] autorelease];
    LabelScalableView *content1Disalbe = [[[LabelScalableView alloc] initWithFrame:CGRectMake(0, 0, 56, 25)] autorelease];
    content1Disalbe.text = text;
    [content1Disalbe fitCurrentFrame];
    static1.bgContent = [[[EnableDisableView alloc] initWithFrame:viewRect isEnable:NO] autorelease];
    static1.content = content1Disalbe;

    
    DragableStaticContainer *dragableVC1 = [[[DragableStaticContainer alloc] initWithDragable:dragable1 andStatic:static1] autorelease];
    return dragableVC1;
}

-(DragableStaticContainer *)createDragableStaticContainerImg:(NSString *)imageName{
    CGFloat w = [UIImage imageNamed:@"top-normal.png"].size.width;
    CGRect viewRect = CGRectMake(0, 0, w, 50);
    
    DragableView *dragable3 = [[[DragableView alloc] initWithFrame:viewRect] autorelease];
    ImageScalableView *content3 = [[[ImageScalableView alloc] initWithImage:[UIImage imageNamed:imageName]] autorelease];
    dragable3.bgContent = [[[EnableDisableView alloc] initWithFrame:viewRect isEnable:YES] autorelease];
    dragable3.content = content3;

    
    StaticView *static3 = [[[StaticView alloc] initWithFrame:viewRect] autorelease];
    ImageScalableView *content3Disable = [[[ImageScalableView alloc] initWithImage:[UIImage imageNamed:imageName]] autorelease];
    content3Disable.alpha = 0.4;
    static3.bgContent = [[[EnableDisableView alloc] initWithFrame:viewRect isEnable:NO] autorelease];
    static3.content = content3Disable;
    
    DragableStaticContainer *dragableVC3 = [[[DragableStaticContainer alloc] initWithDragable:dragable3 andStatic:static3] autorelease];
    return dragableVC3;
}

-(NSArray *)dragableStaticControllers{
    
    DragableStaticContainer *dragableVC1 = [self createDragableStaticContainerText:@"Body"];
    DragableStaticContainer *dragableVC2 = [self createDragableStaticContainerText:@"Some water"];
    DragableStaticContainer *dragableVC3 = [self createDragableStaticContainerImg:@"hat.png"];
    DragableStaticContainer *dragableVC4 = [self createDragableStaticContainerText:@"Beak"];
    DragableStaticContainer *dragableVC5 = [self createDragableStaticContainerImg:@"shoe.png"];
    DragableStaticContainer *dragableVC6 = [self createDragableStaticContainerText:@"The sky"];
    
    return [[[NSMutableArray alloc] initWithObjects:dragableVC1, dragableVC2, dragableVC3, dragableVC4, dragableVC5, dragableVC6,  nil] autorelease];
}


-(ZoneView *) createZoneView:(CGRect) frame withCorrectAnswer:(DragableStaticContainer*)correct{
    ZoneView *zone = [[ZoneView alloc] initWithFrame:frame];
    zone.correctDragableView = correct.dragableView;
    zone.backgroundColor = [UIColor blueColor];
    zone.alpha = 0.5;
    return zone;
}

-(NSArray *) createZonesViewAndLinkTo:(NSArray *)liDragableStarticVC{
    NSMutableArray *liZoneViews = [NSMutableArray arrayWithCapacity:liDragableStarticVC.count];
    
    ZoneView *body = [self createZoneView:CGRectMake(115, 135, 70, 40) withCorrectAnswer:[liDragableStarticVC objectAtIndex:0]];
    [liZoneViews addObject:body];
    [body release];
    
    /*ZoneView *water = [self createZoneView:CGRectMake(290, 200, 70, 40) withCorrectAnswer:[liDragableStarticVC objectAtIndex:1]];
    [liZoneViews addObject:water];
    [water release];
    
    ZoneView *hat = [self createZoneView:CGRectMake(150, 0, 40, 35) withCorrectAnswer:[liDragableStarticVC objectAtIndex:2]];
    [liZoneViews addObject:hat];
    [hat release];
    
    ZoneView *beak = [self createZoneView:CGRectMake(220, 80, 40, 35) withCorrectAnswer:[liDragableStarticVC objectAtIndex:3]];
    [liZoneViews addObject:beak];
    [beak release];
    
    ZoneView *shoe =[self createZoneView:CGRectMake(150, 220, 70, 60) withCorrectAnswer:[liDragableStarticVC objectAtIndex:4]];
    [liZoneViews addObject:shoe];
    [shoe release];
    
    ZoneView *sky = [self createZoneView:CGRectMake(10, 10, 50, 30) withCorrectAnswer:[liDragableStarticVC objectAtIndex:5]];
    [liZoneViews addObject:sky];
    [sky release];*/
    
    return liZoneViews;
}

-(UIView *)createZoneView{
    UIImageView* img = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"doduck.png"]] autorelease];
    img.userInteractionEnabled = YES;
    return img;
}

- (IBAction)checkAnswersTouched:(id)sender {
    [dd correction];
    if([dd isGoodAwnser]){
        resultCorrectLabel.text = @"good answers";
    }else{
        resultCorrectLabel.text = @"wrong answers";
    }
}

-(void) me{
}

- (IBAction)recreate:(id)sender {
    [dd removeFromParentViewController];
    [dd.view removeFromSuperview];
    [dd release];
    dd = nil;
    
    self.view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    
    [self performSelector:@selector(me) withObject:nil afterDelay:10];
}

- (void)dealloc {
    [resultCorrectLabel release];
    [dd release];
    [super dealloc];
}

@end
