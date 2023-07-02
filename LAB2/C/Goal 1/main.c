#include <stdio.h>
#include <stdbool.h>

int main () {
        double Sum = 0;
        int i, N = 0, PositiveCount = 0;
        bool InValid = true;

        printf("\nThis program calculates arithmetic mean of all positive elements.\n\n");
        do {
            printf("Enter number of elements (<21):\n");
            scanf("%d", &N);
            if ( N > 0) {
                InValid = false;
            } else {
                printf("Invalid value. Try again\n");
            }
        } while (InValid);
        double A[N];
        for (i = 0; i < N; i++) {
            printf("Enter element A[%d] (absolute value not bigger than 100 000 000):\n", i + 1);
            scanf("%lf", &A[i]);
        }
        for ( i = 0; i < N; i++) {
            if (A[i] > -1) {
                Sum = Sum + A[i];
                PositiveCount++;
            }
        }
        Sum /= PositiveCount;
        printf("%.3f - ANSWER", Sum);
}

