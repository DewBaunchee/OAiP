#include <stdio.h>

int OutputArray(int *ArrayLength, int n) {

    for (int i = 0; i < n; i++) {
        printf("%d ", ArrayLength[i]);
    }
}

void MainFunctionSort(int *NewArrayLength, int *ArrayLength, int n) {
    int index;
    int relativePosition = 0;
    int firstElementIndex = 0;
    int element = ArrayLength[0];
    for (int i = 1; i < n; i++) {
        if (ArrayLength[i] < element) firstElementIndex++;
    }
    NewArrayLength[firstElementIndex] = element;

    int LeftBorder = firstElementIndex;
    int RightBorder = firstElementIndex;

    for (int i = 1; i < n; i++) {
        element = ArrayLength[i];

        if (element < NewArrayLength[firstElementIndex]) {
            relativePosition = 0;
            for (int j = LeftBorder; j < firstElementIndex; j++) {
                if (NewArrayLength[j] < element) {
                    ++relativePosition;
                }
            }
            LeftBorder--;
            for (int j = LeftBorder; j < LeftBorder + relativePosition; j++) {
                NewArrayLength[j] = NewArrayLength[j + 1];
            }
            index = LeftBorder + relativePosition;
        }

        if (element > NewArrayLength[firstElementIndex]) {
            relativePosition = 0;
            for (int j = RightBorder; j > firstElementIndex; j--) {
                if (NewArrayLength[j] > element) {
                    relativePosition++;
                }
            }
            RightBorder++;
            for (int j = RightBorder; j > RightBorder - relativePosition; j--) {
                NewArrayLength[j] = NewArrayLength[j - 1];
            }
            index = RightBorder - relativePosition;
        }
        printf("\nArray after %d-th step: ", i);
        OutputArray(NewArrayLength, n);
        NewArrayLength[index] = element;
    }
}

int SetArray(int *arrayLength, int *newArrayLength) {
    int n = 0;
    printf("Enter number of elements ( not more than 20 ): ");
    scanf("%d", &n);
    printf("\nEnter elements:\n");
    for (int i = 0; i < n; i++) {
        printf("Array[%d]:", i + 1);
        scanf("%d", &arrayLength[i]);
        newArrayLength[i] = 0;
    }

    return n;
}

int main() {
    int ArrayLength[20], NewArrayLength[20];
    printf("This program sort array by two-way insertion method.\n");
    int n = SetArray(ArrayLength, NewArrayLength);
    MainFunctionSort(NewArrayLength, ArrayLength, n);
    printf("\nArray after sorting: ");
    OutputArray(NewArrayLength, n);
}