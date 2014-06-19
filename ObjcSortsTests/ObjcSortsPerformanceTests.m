//
//  Jesse Squires
//  http://www.jessesquires.com
//
//  GitHub
//  https://github.com/jessesquires/objc-sorts
//
//  Copyright (c) 2014 Jesse Squires
//

#import <XCTest/XCTest.h>

#import "sorts.h"
#import "sortUtils.h"

static const int kMaxCount = 1000;


@interface ObjcSortsPerformanceTests : XCTestCase

@property (strong, nonatomic) NSMutableArray *randomArray;

@end


@implementation ObjcSortsPerformanceTests

- (void)setUp
{
    [super setUp];
    self.randomArray = randomIntegerArray(kMaxCount);
}

- (void)tearDown
{
    self.randomArray = nil;
    [super tearDown];
}

- (void)testObjcSortPerformance
{
    if (![self respondsToSelector:@selector(measureBlock:)]) {
        // Travis-CI does not yet support Xcode6 :(
        return;
    }
    
    [self measureBlock:^{
        objcSort(self.randomArray);
    }];
}

- (void)testQuickSortPerformance
{
    if (![self respondsToSelector:@selector(measureBlock:)]) {
        // Travis-CI does not yet support Xcode6 :(
        return;
    }
    
    [self measureBlock:^{
        quickSort(self.randomArray);
    }];
}

- (void)testHeapSortPerformance
{
    if (![self respondsToSelector:@selector(measureBlock:)]) {
        // Travis-CI does not yet support Xcode6 :(
        return;
    }
    
    [self measureBlock:^{
        heapSort(self.randomArray);
    }];
}

- (void)testInsertionSortPerformance
{
    if (![self respondsToSelector:@selector(measureBlock:)]) {
        // Travis-CI does not yet support Xcode6 :(
        return;
    }
    
    [self measureBlock:^{
        insertionSort(self.randomArray);
    }];
}

- (void)testSelectionSortPerformance
{
    if (![self respondsToSelector:@selector(measureBlock:)]) {
        // Travis-CI does not yet support Xcode6 :(
        return;
    }
    
    [self measureBlock:^{
        selectionSort(self.randomArray);
    }];
}

- (void)testMergeSortPerformance
{
    if (![self respondsToSelector:@selector(measureBlock:)]) {
        // Travis-CI does not yet support Xcode6 :(
        return;
    }
    
    [self measureBlock:^{
        mergeSort(self.randomArray);
    }];
}

- (void)testBubbleSortPerformance
{
    if (![self respondsToSelector:@selector(measureBlock:)]) {
        // Travis-CI does not yet support Xcode6 :(
        return;
    }
    
    [self measureBlock:^{
        bubbleSort(self.randomArray);
    }];
}

@end
