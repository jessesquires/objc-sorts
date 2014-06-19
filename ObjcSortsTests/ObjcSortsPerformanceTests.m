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
    [self measureBlock:^{
        objcSort(self.randomArray);
    }];
}

- (void)testQuickSortPerformance
{
    [self measureBlock:^{
        quickSort(self.randomArray);
    }];
}

- (void)testHeapSortPerformance
{
    [self measureBlock:^{
        heapSort(self.randomArray);
    }];
}

- (void)testInsertionSortPerformance
{
    [self measureBlock:^{
        insertionSort(self.randomArray);
    }];
}

- (void)testSelectionSortPerformance
{
    [self measureBlock:^{
        selectionSort(self.randomArray);
    }];
}

- (void)testMergeSortPerformance
{
    [self measureBlock:^{
        mergeSort(self.randomArray);
    }];
}

- (void)testBubbleSortPerformance
{
    [self measureBlock:^{
        bubbleSort(self.randomArray);
    }];
}

@end
