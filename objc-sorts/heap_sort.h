//
//  Jesse Squires
//  http://www.hexedbits.com
//
//  GitHub
//  https://github.com/jessesquires/objc-sorts
//
//  Copyright (c) 2014 Jesse Squires
//

#import "sort_utils.h"

#ifndef objc_sorts_heap_sort_h
#define objc_sorts_heap_sort_h

void sift_down(NSMutableArray *arr, NSInteger start, NSInteger end)
{
    NSInteger root = start;
    
    while((root * 2 + 1) <= end) {
        NSInteger child = root * 2 + 1;
        
        if(child + 1 <= end && [[arr objectAtIndex:child] integerValue] < [[arr objectAtIndex:child + 1] integerValue])
            child++;
        
        if([[arr objectAtIndex:root] integerValue] < [[arr objectAtIndex:child] integerValue]) {
            [arr exchangeObjectAtIndex:root withObjectAtIndex:child];
            root = child;
        }
        else
            return;
    }
}

void heapify(NSMutableArray *arr, NSInteger count)
{
    NSInteger start = (count - 2) / 2;
    
    while(start >= 0) {
        sift_down(arr, start, count - 1);
        start--;
    }
}

void heap_sort(NSMutableArray *arr)
{
    heapify(arr, arr.count);
    
    NSInteger end = arr.count - 1;
    
    while(end > 0) {
        [arr exchangeObjectAtIndex:end withObjectAtIndex:0];
        sift_down(arr, 0, end - 1);
        end--;
    }
}

void test_heap_sort(NSMutableArray *arr)
{
    NSLog(@"\n\nRunning heap sort...");
    NSDate *start = [NSDate date];
    heap_sort(arr);
    NSTimeInterval end = [start timeIntervalSinceNow] * -1;
    verfiySorted(arr);
    NSLog(@"Heap sort DONE: %lf", end);
}

#endif
