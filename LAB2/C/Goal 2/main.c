#include <stdio.h>
#include <stdbool.h>

int* convert (int P, int* Answer) {
    int i = 0;
    while ( P > 0 ) {
        Answer[i] = P % 2;
        P = (P - (P % 2))/2;
        i++;
    }
    return Answer;
}
void output (int* Answer) {
    int i;
    printf("Answer : ");
    for (i = 30; i > -1; i--) {
        printf("%d", Answer[i]);
    }
}
void main () {
    int P = 0;
    int Answer[32] = {0};
    bool InValid = true;
    printf("\nThis program converts a number from decimal to binary.\n\n");
    do {
        printf("Enter element (not bigger than 2 147 483 647):");
        scanf("%d", &P);
        if ( P > 0) {
            InValid = false;
        } else {
            printf("Entered number isn't natural\n");
        }
    } while (InValid);

    output(convert(P, Answer));
}

