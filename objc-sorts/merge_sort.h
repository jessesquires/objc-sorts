//
//  merge_sort.h
//  objc-sorts
//
//  Created by Jesse Squires on 6/6/13.
//  Copyright (c) 2013 Hexed Bits. All rights reserved.
//

#ifndef objc_sorts_mergesort_h
#define objc_sorts_mergesort_h

void merge(NSMutableArray *arr, NSUInteger first, NSUInteger mid, NSUInteger last)
{
    NSMutableArray *tempArr = [[NSMutableArray alloc] init];
    NSUInteger indexA = first;
    NSUInteger indexB = mid;
    
    while(indexA < mid && indexB < last) {
        NSNumber *numA = [arr objectAtIndex:indexA];
        NSNumber *numB = [arr objectAtIndex:indexB];
        
        if(numA.integerValue < numB.integerValue) {
            [tempArr addObject:numA];
            indexA++;
        }
        else {
            [tempArr addObject:numB];
            indexB++;
        }
    }
    
    while(indexA < mid) {
        [tempArr addObject:[arr objectAtIndex:indexA]];
        indexA++;
    }
    
    while(indexB < last) {
        [tempArr addObject:[arr objectAtIndex:indexB]];
        indexB++;
    }
    
    indexA = first;
    for(NSUInteger i = 0; i < tempArr.count; i++) {
        [arr replaceObjectAtIndex:indexA withObject:[tempArr objectAtIndex:i]];
        indexA++;
    }
}

void merge_sort(NSMutableArray *arr, NSUInteger first, NSUInteger last)
{
    if(first + 1 < last) {
        NSUInteger mid = (first + last) / 2;
        merge_sort(arr, first, mid);
        merge_sort(arr, mid, last);
        merge(arr, first, mid, last);
    }
}

#endif
