#include <stdio.h>

void main () {
    int N, I, sign = -1;
    int A[10];

    printf("Number of elements (<11): \n");
    scanf("%d", &N);
    for (I = 0; I < N; I++) {
        printf ("A[%d]:", I);
        scanf("%d", &A[I]);
    }

    for (I = 1; I < N; I++) {
        A[0] = A[0] + sign*A[I];
        sign = -sign;
    }

    printf("%d - answer", A[0]);
    scanf("%d", &N);
}
