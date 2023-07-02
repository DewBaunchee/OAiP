#include <stdio.h>
#include <stdbool.h>

bool isMatrixIdentity (int N, int (*A)[N]) {
    int col;

    for ( int row = 0; row < N; row++ ) {
        col = 0;
        while ( col < N) {
            if ( col == row ) {
                if (A[row][col] == 1) {
                    col++;
                } else {
                    return false;
                }
            } else {
                if (A[row][col] == 0) {
                    col++;
                } else {
                    return false;
                }
            }
        }
    }
    return true;
}


void main() {
    FILE *inF = fopen("D:\\University\\OAiP\\LAB2\\C\\Goal 3\\input.txt", "r");
    FILE *outF = fopen("D:\\University\\OAiP\\LAB2\\C\\Goal 3\\output.txt", "w");

    int N = 0;
    fscanf(inF, "%d", &N);
    int A[N][N];
    for(int i = 0; i < N; i++) {
        for(int j = 0; j < N; j++) {
            fscanf(inF, "%d ", &A[i][j]);
        }
    }
    fprintf(outF,"Is entered matrix identity?\n");
    printf("Is entered matrix identity?\n");
    int j;
    for (int i = 0; i < N; i++) {
        for (j = 0; j < N - 1; j++) {
            fprintf(outF, "%d, ", A[i][j]);
            printf("%d, ", A[i][j]);
        }
        fprintf(outF, "%d\n", A[i][j]);
        printf("%d\n", A[i][j]);
    }
    if (isMatrixIdentity(N, A)) {
        fprintf(outF,"YES");
        printf("YES");
    } else {
        fprintf(outF, "NO");
        printf("NO");
    }

    fclose(inF);
    fclose(outF);
}

