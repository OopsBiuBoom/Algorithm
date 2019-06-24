//
//  main.c
//  QuickSort
//
//  Created by Bii on 2019/6/22.
//  Copyright © 2019 Algorithm. All rights reserved.
//

#include <stdio.h>

void swap(int arr[], int x, int y) {
    int temp = arr[x];
    arr[x] = arr[y];
    arr[y] = temp;
}

void QuickSort(int arr[], int low, int height) {
    
    int pivot = height;
    
    while (low < height) {
        if (arr[low] > arr[pivot]) {
            
        }
    }
}

int main(int argc, const char * argv[]) {
    
    int arr[10] = {223,11,41,353,132,123435,123,75,2,92};
    QuickSort(arr, 0, 9);
    return 0;
}
