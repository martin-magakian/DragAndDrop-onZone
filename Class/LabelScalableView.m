//
//  LabelScalableView.m
//  DragAndDrop
//
//  Created by martin on 14/06/2013.
//  Copyright (c) 2013 doduck.com. All rights reserved.
//

#import "LabelScalableView.h"

@implementation LabelScalableView


-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        self.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}


-(void)fitCurrentFrame{
    
    CGSize iHave = self.frame.size;
    
    BOOL isContained = NO;
    do{
        CGSize iWant = [self.text sizeWithFont:self.font];
        if(iWant.width > iHave.width || iWant.height > iHave.height){
            self.font = [UIFont fontWithName:self.font.fontName size:self.font.pointSize - 0.1];
            isContained = NO;
        }else{
            isContained = YES;
        }
        
    }while (isContained == NO);
}

-(void)resizeScale:(CGFloat)scale{
    self.frame = CGRectMake(0,
                            0,
                            self.frame.size.width *scale,
                            self.frame.size.height *scale);
    [self fitCurrentFrame];
    
    
}



@end
