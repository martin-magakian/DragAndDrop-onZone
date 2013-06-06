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

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	
    DragDropManagerVC *dd = [[DragDropManagerVC alloc] initWithDragableItem:[self createDragableItem] withZones:[self createZones] forZoneView:[self createZoneView]];
    dd.view.frame = CGRectMake(20, 100, 700, 500);
    dd.view.backgroundColor = [UIColor yellowColor];
    
    [self.view addSubview:dd.view];
}

-(NSArray *)createDragableItem{
    
    DragableView *item1 = [[DragableView alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
    UILabel *content1 = [[UILabel alloc] init];
    content1.text = @"The head";
    [content1 sizeToFit];
    item1.content = content1;
    item1.backgroundColor = [UIColor redColor];
    
    DragableView *item2 = [[DragableView alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
    item2.backgroundColor = [UIColor blackColor];
    
    DragableView *item3 = [[DragableView alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
    item3.backgroundColor = [UIColor magentaColor];
    
    DragableView *item4 = [[DragableView alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
    item4.backgroundColor = [UIColor purpleColor];
    
    DragableView *item5 = [[DragableView alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
    item5.backgroundColor = [UIColor greenColor];
    
    return [[[NSMutableArray alloc] initWithObjects:item1, item2, item3, item4, item5, nil] autorelease];
}

-(NSArray *)createZones{
    NSValue *zone1 = [NSValue valueWithCGRect:CGRectMake(0, 0, 30, 15)];
    
    NSValue *zone2 = [NSValue valueWithCGRect:CGRectMake(100, 30, 40, 15)];
    
    NSValue *zone3 = [NSValue valueWithCGRect:CGRectMake(100, 100, 20, 15)];
    
    return [[[NSMutableArray alloc] initWithObjects:zone1, zone2, zone3, nil] autorelease];
}

-(UIView *)createZoneView{
    return [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"doduck.png"]];
}

@end
