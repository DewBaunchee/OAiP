#include <stdio.h>

void main () {
    int M, N, R;

    printf("GCD of numbers: m, n\n");
    scanf("%d", &M);
    scanf("%d", &N);
    if ( M < N) {
       R = M;
       M = N;
       N = R;
    }
    do {
        R = M % N;
        M = N;
        N = R;
    } while ( R != 0 );

    printf ("Is: %d", M);
    scanf("%d", &M);
}
