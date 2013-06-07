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
#import "DragDropManagerVC.h"
#import "StaticView.h"
#import "DragableStaticContainer.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	
    DragDropManagerVC *dd = [[DragDropManagerVC alloc] initWithDragableStaticControllers:[self DragableStaticControllers] withZones:[self createZones] forZoneView:[self createZoneView]];
    dd.view.frame = CGRectMake(20, 100, 700, 500);
    dd.view.backgroundColor = [UIColor yellowColor];
    
    [self.view addSubview:dd.view];
}


-(DragableStaticContainer *)createDragableStaticContainerText:(NSString *) text{
    CGRect viewRect = CGRectMake(0, 0, 100, 50);
    
    DragableView *dragable1 = [[DragableView alloc] initWithFrame:viewRect];
    UILabel *content1 = [[UILabel alloc] init];
    content1.text = text;
    content1.textColor = [UIColor blueColor];
    [content1 sizeToFit];
    dragable1.content = content1;
    dragable1.backgroundColor = [UIColor redColor];
    
    StaticView *static1 = [[StaticView alloc] initWithFrame:viewRect];
    UILabel *content1Disalbe = [[UILabel alloc] init];
    content1Disalbe.text = text;
    content1Disalbe.textColor = [UIColor blackColor];
    [content1Disalbe sizeToFit];
    static1.content = content1Disalbe;
    static1.backgroundColor = [UIColor grayColor];
    
    DragableStaticContainer *dragableVC1 = [[DragableStaticContainer alloc] initWithDragable:dragable1 andStatic:static1];
    return dragableVC1;
}

-(DragableStaticContainer *)createDragableStaticContainerImg:(NSString *)imageName{
    CGRect viewRect = CGRectMake(0, 0, 100, 50);
    
    DragableView *dragable3 = [[DragableView alloc] initWithFrame:viewRect];
    UIImageView *content3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
    dragable3.content = content3;
    dragable3.backgroundColor = [UIColor purpleColor];
    
    StaticView *static3 = [[StaticView alloc] initWithFrame:viewRect];
    UIImageView *content3Disable = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
    content3Disable.alpha = 0.4;
    static3.content = content3Disable;
    static3.backgroundColor = [UIColor grayColor];
    
    DragableStaticContainer *dragableVC3 = [[DragableStaticContainer alloc] initWithDragable:dragable3 andStatic:static3];
    return dragableVC3;
}

-(NSArray *)DragableStaticControllers{
    
    DragableStaticContainer *dragableVC1 = [self createDragableStaticContainerText:@"Body"];
    DragableStaticContainer *dragableVC2 = [self createDragableStaticContainerText:@"Some water"];
    DragableStaticContainer *dragableVC3 = [self createDragableStaticContainerImg:@"hat.png"];
    DragableStaticContainer *dragableVC4 = [self createDragableStaticContainerText:@"Beak"];
    DragableStaticContainer *dragableVC5 = [self createDragableStaticContainerImg:@"shoe.png"];
    DragableStaticContainer *dragableVC6 = [self createDragableStaticContainerText:@"The sky"];
    
    return [[[NSMutableArray alloc] initWithObjects:dragableVC1, dragableVC2, dragableVC3, dragableVC4, dragableVC5, dragableVC6,  nil] autorelease];
}

-(NSArray *)createZones{
    NSValue *zoneBody = [NSValue valueWithCGRect:CGRectMake(115, 135, 70, 40)];
    
    NSValue *zoneWater = [NSValue valueWithCGRect:CGRectMake(290, 200, 70, 40)];
    
    NSValue *zoneHat = [NSValue valueWithCGRect:CGRectMake(150, 0, 40, 35)];
    
    NSValue *zoneBeak = [NSValue valueWithCGRect:CGRectMake(220, 80, 40, 35)];
    
    NSValue *zoneShoe = [NSValue valueWithCGRect:CGRectMake(150, 220, 70, 60)];
    
    NSValue *zoneSky = [NSValue valueWithCGRect:CGRectMake(10, 10, 50, 30)];
    
    return [[[NSMutableArray alloc] initWithObjects:zoneBody, zoneWater, zoneHat, zoneBeak, zoneShoe, zoneSky, nil] autorelease];
}

-(UIView *)createZoneView{
    return [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"doduck.png"]];
}

@end
