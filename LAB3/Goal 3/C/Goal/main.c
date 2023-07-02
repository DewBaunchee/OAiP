#include <stdio.h>

void printArray(int *myArray, int n) {
    printf("{ ");
    for (int i = 0; i < n - 1; i++) {
        printf("%d, ", myArray[i]);
    }
    printf("%d }\n", myArray[n - 1]);
}

int InputData(int *myArray) {
    int n;
    printf("Enter number of elements: \n");
    scanf("%d", &n);
    for (int i = 0; i < n; i++) {
        printf("MyArray[%d]:", i + 1);
        scanf("%d", &myArray[i]);
    }
    return n;
}

int InputDataFromFile(int *myArray) {
    FILE *inF = fopen("D:\\University\\OAiP\\LAB3\\Goal 3\\C\\Goal\\input.txt", "r");
    int n;
    fscanf(inF, "%d", &n);
    for (int i = 0; i < n; i++) {
        fscanf(inF, "%d", &myArray[i]);
    }
    fclose(inF);
    return n;
}

void sorting(int *myArray, int n) {
    int temp, k, breaker = 1;
    for (int i = 1; i < n; i++) {
        temp = myArray[i];
        k = i - 1;
        while (breaker && k > -1) {
            if (temp < myArray[k]) {
                myArray[k + 1] = myArray[k];
                myArray[k] = temp;
                k--;
            } else {
                breaker = 0;
            }
        }
        breaker = 1;
        printf("%d step of sorting: \n", i);
        printArray(myArray, n);
    }
}

void outputData(int *myArray, int n) {
    FILE *outF = fopen("D:\\University\\OAiP\\LAB3\\Goal 3\\C\\Goal\\output.txt", "w");
    printf("Sorted array: \n");
    printArray(myArray, n);
    fprintf(outF, "Sorted array: \n");
    fprintf(outF, "{ ");
    for (int i = 0; i < n - 1; i++) {
        fprintf(outF, "%d, ", myArray[i]);
    }
    fprintf(outF, "%d }\n", myArray[n - 1]);
    fclose(outF);
}

void main() {
    int inValid = 1;
    char choice;
    int n;
    printf("This program sort entered array by simple insertions.\n");
    int myArray[20];
    printf("Select array input method: \"C\" - console\n");
    printf("                           \"F\" - file\n");
    do {
        fflush(stdin);
        scanf("%c", &choice);
        switch (choice) {
            case 'C':
                n = InputData(myArray);
                inValid = 0;
                break;
            case 'F':
                n = InputDataFromFile(myArray);
                inValid = 0;
                break;
            default:
                printf("Error! Try again.\n");
                break;
        }
    } while (inValid);
    printf("Entered array: \n");
    printArray(myArray, n);
    printf("\n");
    sorting(myArray, n);
    outputData(myArray, n);
}