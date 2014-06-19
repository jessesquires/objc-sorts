//
//  Jesse Squires
//  http://www.jessesquires.com
//
//  GitHub
//  https://github.com/jessesquires/objc-sorts
//
//  Copyright (c) 2014 Jesse Squires
//

#import "sortUtils.h"

BOOL arrayIsSorted(NSMutableArray *arr)
{
    for (NSUInteger i = 0; i < arr.count - 1; i++) {
        NSInteger a = [[arr objectAtIndex:i] integerValue];
        NSInteger b = [[arr objectAtIndex:i + 1] integerValue];
        
        if (a > b) {
            return NO;
        }
    }
    return YES;
}

NSMutableArray* randomIntegerArray(NSUInteger count)
{
    NSLog(@"Generating array of %ld random integers in range [0, %u)...", count, UINT32_MAX);
    
    NSMutableArray *arr = [[NSMutableArray alloc] initWithCapacity:count];
    
    for (NSUInteger i = 0; i < count; i++) {
        NSNumber *number = [NSNumber numberWithInteger:arc4random_uniform(UINT32_MAX)];
        [arr addObject:number];
    }
    
    assert(!arrayIsSorted(arr));
    return arr;
}

NSString* sortAlgorithmNameForType(SortAlgorithmType type)
{
    switch (type) {
        case SortAlgorithmTypeObjC:
            return @"Objective-C";
            
        case SortAlgorithmTypeQuick:
            return @"Quick";
            
        case SortAlgorithmTypeHeap:
            return @"Heap";
            
        case SortAlgorithmTypeInsertion:
            return @"Insertion";
            
        case SortAlgorithmTypeSelection:
            return @"Selection";
            
        case SortAlgorithmTypeMerge:
            return @"Merge";
            
        case SortAlgorithmTypeBubble:
            return @"Bubble";
    }
}

NSTimeInterval sortArrayWithNameUsingBlock(NSMutableArray *anArray,
                                           SortAlgorithmType sortType,
                                           SortAlgorithmBlock sortBlock)
{
    NSMutableArray *arrCopy = [anArray mutableCopy];
    
    NSLog(@"Running %@...", sortAlgorithmNameForType(sortType));
    
    NSDate *startTime = [NSDate date];
    
    sortBlock(arrCopy);
    
    NSTimeInterval totalTime = startTime.timeIntervalSinceNow * -1;
    
    assert(arrayIsSorted(arrCopy));
    
    NSLog(@"%@ finished in %lf sec\n", sortAlgorithmNameForType(sortType), totalTime);
    
    return totalTime;
}
