#include <stdio.h>
#include <math.h>

int main () {
    float X1, X2, Y1, Y2, R1, R2;
    char Answer;

    printf(‘Do points lie on the same circle?\n’);
    printf("x1: \n");
    scanf("%f", &X1);
    printf("y1: \n");
    scanf("%f", &Y1);
    printf("x2: \n");
    scanf("%f", &X2);
    printf("y2: \n");
    scanf("%f", &Y2);

    R1 = sqrt(X1*X1 + Y1*Y1);
    R2 = sqrt(X2*X2 + Y2*Y2);
    if ( abs(R2 – R1) < 0.001 ) {
        Answer = ‘Y’;
    } else {
        Answer = ‘N’;
    }
    printf(‘%c’, Answer);
    scanf("%f", &R1);
    return 0;
}
