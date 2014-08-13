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


@interface ObjcSortsTests : XCTestCase

@property (strong, nonatomic) NSArray *sortedArray;
@property (strong, nonatomic) NSMutableArray *unsortedArray;

@end


@implementation ObjcSortsTests

- (void)setUp
{
    [super setUp];
    self.sortedArray = [NSArray arrayWithObjects:@0, @1, @4, @10, @23, @34, @34, @35, @66, @75, @87, @98, @687, @809, @9324, nil];
    self.unsortedArray = [NSMutableArray arrayWithObjects:@23, @87, @1, @0, @34, @687, @34, @75, @10, @9324, @809, @98, @35, @4, @66, nil];
}

- (void)tearDown
{
    self.sortedArray = nil;
    self.unsortedArray = nil;
    [super tearDown];
}

- (void)testObjcSort
{
    XCTAssertFalse([self.sortedArray isEqualToArray:self.unsortedArray], @"Arrays should not be equal before sorting");
    objcSort(self.unsortedArray);
    XCTAssertTrue([self.sortedArray isEqualToArray:self.unsortedArray], @"Arrays should be equal before sorting");
}

- (void)testQuickSort
{
    XCTAssertFalse([self.sortedArray isEqualToArray:self.unsortedArray], @"Arrays should not be equal before sorting");
    quickSort(self.unsortedArray);
    XCTAssertTrue([self.sortedArray isEqualToArray:self.unsortedArray], @"Arrays should be equal before sorting");
}

- (void)testHeapSort
{
    XCTAssertFalse([self.sortedArray isEqualToArray:self.unsortedArray], @"Arrays should not be equal before sorting");
    heapSort(self.unsortedArray);
    XCTAssertTrue([self.sortedArray isEqualToArray:self.unsortedArray], @"Arrays should be equal before sorting");
}

- (void)testInsertionSort
{
    XCTAssertFalse([self.sortedArray isEqualToArray:self.unsortedArray], @"Arrays should not be equal before sorting");
    insertionSort(self.unsortedArray);
    XCTAssertTrue([self.sortedArray isEqualToArray:self.unsortedArray], @"Arrays should be equal before sorting");
}

- (void)testSelectionSort
{
    XCTAssertFalse([self.sortedArray isEqualToArray:self.unsortedArray], @"Arrays should not be equal before sorting");
    selectionSort(self.unsortedArray);
    XCTAssertTrue([self.sortedArray isEqualToArray:self.unsortedArray], @"Arrays should be equal before sorting");
}

- (void)testMergeSort
{
    XCTAssertFalse([self.sortedArray isEqualToArray:self.unsortedArray], @"Arrays should not be equal before sorting");
    mergeSort(self.unsortedArray);
    XCTAssertTrue([self.sortedArray isEqualToArray:self.unsortedArray], @"Arrays should be equal before sorting");
}

- (void)testBubbleSort
{
    XCTAssertFalse([self.sortedArray isEqualToArray:self.unsortedArray], @"Arrays should not be equal before sorting");
    bubbleSort(self.unsortedArray);
    XCTAssertTrue([self.sortedArray isEqualToArray:self.unsortedArray], @"Arrays should be equal before sorting");
}

@end
