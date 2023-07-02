#include <stdio.h>

void sort(int *arr, int Size) {
    int Value, i, j;
    for (i = 0; i < Size; i++) {
        for (j = 0; j < Size; j++) {
            if (arr[i] < arr[j]) {
                Value = arr[j];
                arr[j] = arr[i];
                arr[i] = Value;
            }
        }
    }
}
void splitToInt(int *arr, int Size, FILE *inF) {
    int i;
    for (i = 0; i < Size; i++) {
        fscanf(inF, "%d", &arr[i]);
    }
}
int arrConcat(int *C, int *A, int SizeA, int *B, int SizeB) {
    int i;

    for (i = 0; i < SizeA; i++) {
        C[i] = A[i];
    }
    for (i = SizeA; i - SizeA < SizeB; i++) {
        C[i] = B[i - SizeA];
    }
}
void arrOut(int *arr, int Size, FILE *outF) {
    int i;
    for (i = 0; i < Size; i++) {
        fprintf(outF, "%d ", arr[i]);
        printf("%d ", arr[i]);
    }
}
void main() {
    FILE *inF = fopen("E:\\University\\OAiP\\LAB2\\C\\Goal 4\\in.txt", "r");
    FILE *outF = fopen("E:\\University\\OAiP\\LAB2\\C\\Goal 4\\out.txt", "w");
    int N, M;

    fscanf(inF, "%d\n%d", &N, &M);
    int A[N];
    int B[M];
    int SizeC = M + N;
    int C[SizeC];
    splitToInt(A, N, inF);
    splitToInt(B, M, inF);
    sort(A, N);
    sort(B, M);
    arrConcat(C, A, N, B, M);
    sort(C, sizeof(C)/4);

    arrOut(C, N + M, outF);

    fclose(inF);
    fclose(outF);
}
