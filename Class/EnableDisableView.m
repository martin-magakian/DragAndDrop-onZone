//
//  EnableDisableView.m
//  DragAndDrop
//
//  Created by martin on 13/06/2013.
//  Copyright (c) 2013 doduck.com. All rights reserved.
//

#import "EnableDisableView.h"

@implementation EnableDisableView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor redColor];
    }
    return self;
}

-(void)selected:(BOOL)enable{
    if(enable){
        self.backgroundColor = [UIColor blueColor];
    }else{
        self.backgroundColor = [UIColor redColor];
    }
}


-(void)toDisplay:(BOOL)isDisplay{
    if(isDisplay){
        [UIView animateWithDuration:0.15 animations:^{
            self.alpha = 1.0;
        }];
    }else{
        [UIView animateWithDuration:0.15 animations:^{
            self.alpha = 0.0;
        }];
    }
}

@end
