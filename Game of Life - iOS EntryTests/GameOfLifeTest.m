//
//  GameOfLifeTest.m
//  Game of Life - iOS Entry
//
//  Created by Josh Allen on 2015-06-11.
//  Copyright (c) 2015 Connected Lab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

@interface GameOfLifeTest : XCTestCase

@end

@implementation GameOfLifeTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

// TODO: First Test - top left neighbour is set
- (void)testSubject_condition1_expectedResult {
    // Setup Test
    NSArray *grid = @[
                  @[@1, @0, @0],
                  @[@0, @1, @0],
                  @[@0, @0, @0]
                  ];
    // Execute Test...
    
    // Validate Test...
}

// TODO: Next Test - top neighbour is set
- (void)testSubject_condition2_expectedResult {
    // Setup Test
    NSArray *grid = @[
                      @[@0, @1, @0],
                      @[@0, @1, @0],
                      @[@0, @0, @0]
                      ];
    // Execute Test...
    
    // Validate Test...
}


// TODO: You're getting the idea, one test for each neighbour
- (void)testSubject_condition3_expectedResult {
    // Setup Test
    NSArray *grid = @[
                      @[@0, @0, @1],
                      @[@0, @1, @0],
                      @[@0, @0, @0]
                      ];
    // Execute Test...
    
    // Validate Test...
}


@end
