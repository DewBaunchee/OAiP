#include <stdio.h>
#include <string.h>

int inputData(char *st1, char *st2) {
    int k;
    printf("Enter St1: \n");
    fflush(stdin);
    fgets(st1, 100, stdin);
    printf("Enter St2: \n");
    fgets(st2, 100, stdin);
    fflush(stdin);
    printf("Enter K: \n");
    scanf("%d", &k);
    return k;
}

int inputDataFromFile(char *st1, char *st2) {
    int k;
    FILE *inF = fopen("D:\\University\\OAiP\\LAB3\\Goal 1\\C\\goal\\input.txt", "r");
    fgets(st1, 100, inF);
    fgets(st2, 100, inF);
    fscanf(inF, "%d", &k);
    printf("Entered St1: %sEntered St2: %sEntered K: %d\n" , st1, st2, k);
    fclose(inF);
    return k;
}

void substr(char *temp, char *st2, int begin, int end) {
    int j = 0;
    for (int i = begin; i < end; i++) {
        temp[j] = st2[i];
        j++;
    }
    temp[j] = '\0';

}

int definition(char *st1, char *st2, int k) {
    int term = strlen(st2) - strlen(st1) + 1, j = 0;
    char temp[strlen(st1) + 1];

    while ((j < term) && (k > 1)) {
        substr(temp, st2, j, (j + strlen(st1)));
        if (strcmp(st1, temp) == 0) {
            k--;
        }
        j++;
    }
    for (j; j < term; j++) {
        substr(temp, st2, j, (j + strlen(st1)));
        if (strcmp(st1, temp) == 0) {
            return j + 1;
        }
    }
    return 0;
}

void outputData(int answer) {
        FILE *outF = fopen("D:\\University\\OAiP\\LAB3\\Goal 1\\C\\goal\\output.txt", "w");
        fprintf(outF, "%d - answer", answer);
        printf("%d - answer", answer);
        fclose(outF);
}

void main() {
    char st1[101], st2[101];
    char choice;
    int k = 0, valid = 1;

    printf("This program defines index of k-th match of St1 in St2 (length of St1 and St2 not bigger than 100). \nIf there are no matches it should return 0 \n\n");
    do {
        printf("Enter \"C\" if you want to input data from console or \n\"F\" if you want to input data from file:\n");
        fflush(stdin);
        scanf("%c", &choice);
        switch (choice) {
            case 'C' :
                k = inputData(st1, st2);
                valid = 0;
                break;
            case 'F' :
                k = inputDataFromFile(st1, st2);
                valid = 0;
                break;
        }
    } while (valid);
    st1[strlen(st1) - 1] = '\0';
    st2[strlen(st2) - 1] = '\0';
    outputData(definition(st1, st2, k));
}
