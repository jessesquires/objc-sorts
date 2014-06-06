//
//  Jesse Squires
//  http://www.hexedbits.com
//
//  GitHub
//  https://github.com/jessesquires/objc-sorts
//
//  Copyright (c) Jesse Squires
//

#import "sort_utils.h"

#ifndef objc_sorts_mergesort_h
#define objc_sorts_mergesort_h

void merge(NSMutableArray *arr, NSUInteger first, NSUInteger mid, NSUInteger last)
{
    NSMutableArray *tempArr = [[NSMutableArray alloc] init];
    NSUInteger indexA = first;
    NSUInteger indexB = mid;
    
    while (indexA < mid && indexB < last) {
        NSNumber *numA = [arr objectAtIndex:indexA];
        NSNumber *numB = [arr objectAtIndex:indexB];
        
        if (numA.integerValue < numB.integerValue) {
            [tempArr addObject:numA];
            indexA++;
        }
        else {
            [tempArr addObject:numB];
            indexB++;
        }
    }
    
    while (indexA < mid) {
        [tempArr addObject:[arr objectAtIndex:indexA]];
        indexA++;
    }
    
    while (indexB < last) {
        [tempArr addObject:[arr objectAtIndex:indexB]];
        indexB++;
    }
    
    indexA = first;
    for (NSUInteger i = 0; i < tempArr.count; i++) {
        [arr replaceObjectAtIndex:indexA withObject:[tempArr objectAtIndex:i]];
        indexA++;
    }
}

void merge_sort(NSMutableArray *arr, NSUInteger first, NSUInteger last)
{
    if (first + 1 < last) {
        NSUInteger mid = (first + last) / 2;
        merge_sort(arr, first, mid);
        merge_sort(arr, mid, last);
        merge(arr, first, mid, last);
    }
}

void test_merge_sort(NSMutableArray *arr)
{
    NSLog(@"Running merge sort...");
    NSDate *start = [NSDate date];
    merge_sort(arr, 0, arr.count);
    NSTimeInterval end = [start timeIntervalSinceNow] * -1;
    verfiySorted(arr);
    NSLog(@"Merge sort finished in %lf sec\n\n", end);
}

#endif
