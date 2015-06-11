//
//  GameOfLife.h
//  Game of Life - iOS Entry
//
//  Created by Josh Allen on 2015-06-11.
//  Copyright (c) 2015 Connected Lab. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameOfLife : NSObject

- (NSInteger) numNeighbours:(NSArray*)grid atX:(NSInteger)x atY:(NSInteger)y;

- (NSArray*) iterate:(NSArray*)grid;

@end
