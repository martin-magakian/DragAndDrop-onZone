//
//  EnableDisableView.m
//  DragAndDrop
//
//  Created by martin on 13/06/2013.
//  Copyright (c) 2013 doduck.com. All rights reserved.
//

#import "EnableDisableView.h"

@implementation EnableDisableView

@synthesize top,middle,bottom;

- (id)initWithFrame:(CGRect)frame isEnable:(BOOL)enable
{
    self = [super initWithFrame:frame];
    if (self) {
        scale = 1.0f;
        isEnable = enable;
        
        NSString *suffix = isEnable? @"normal" : @"disable";
        
        [self initImgWithSuffix:suffix];
        [self addSubview:top];
        [self addSubview:middle];
        [self addSubview:bottom];
        
        
        
        [self positionImgAndScale];
    }
    return self;
}

-(void)initImgWithSuffix:(NSString *)suffix{
    NSString *topName = [NSString stringWithFormat:@"top-%@.png",suffix];
    NSString *middleName = [NSString stringWithFormat:@"middle-%@.png",suffix];
    NSString *bottomName = [NSString stringWithFormat:@"bottom-%@.png",suffix];
    
    self.top = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:topName]] autorelease];
    self.middle = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:middleName]] autorelease];
    self.bottom = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:bottomName]] autorelease];
}

-(void)changePictFor:(NSString *)suffix{
    NSString *topName = [NSString stringWithFormat:@"top-%@.png",suffix];
    NSString *middleName = [NSString stringWithFormat:@"middle-%@.png",suffix];
    NSString *bottomName = [NSString stringWithFormat:@"bottom-%@.png",suffix];
    
    [self.top setImage:[UIImage imageNamed:topName]];
    [self.middle setImage:[UIImage imageNamed:middleName]];
    [self.bottom setImage:[UIImage imageNamed:bottomName]];
}


-(void)positionImgAndScale{
    CGFloat middleHeight = self.frame.size.height - top.frame.size.height - bottom.frame.size.height;
    
    CGFloat middleHeightScale = middleHeight * scale;
    
    self.frame = CGRectMake(self.frame.origin.x,
                            self.frame.origin.y,
                            self.frame.size.width,
                            top.frame.size.height + bottom.frame.size.height + middleHeightScale);
    
    
    bottom.frame = CGRectMake(bottom.frame.origin.x,
                              self.frame.size.height - bottom.frame.size.height,
                              bottom.frame.size.width,
                              bottom.frame.size.height);
    
    middle.frame = CGRectMake(middle.frame.origin.x,
                              top.frame.origin.y+top.frame.size.height,
                              middle.frame.size.width,
                              middleHeightScale);
}

-(void)selected:(BOOL)enable{
    if(enable){
        [self changePictFor:@"enable"];
    }else{
        if(isEnable == NO){
            [self changePictFor:@"disable"];
        }else{
            [self changePictFor:@"normal"];
        }
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

-(void)resizeScale:(CGFloat)_scale{
    
    scale = _scale;
    
    [self positionImgAndScale];
}

-(void) dealloc{
    [top release];
    [middle release];
    [bottom release];
    [super dealloc];
}


@end
