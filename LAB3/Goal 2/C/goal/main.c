#include <stdio.h>
#include <string.h>

void inputData(char *s) {
    printf("Enter string: \n");
    fflush(stdin);
    fgets(s, 100, stdin); //42
}

void inputDataFromFile(char *s) {
    FILE *inF = fopen("D:\\University\\OAiP\\LAB3\\Goal 2\\C\\goal\\input.txt", "r");
    fgets(s, 100, inF);
    printf("Entered string: %s\n", s);
    fclose(inF);
}

void creating(char *s, char *answer) {
    char pattern[18] = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '.', '^', '!', '+', '-', '*', '/'};
    int j = 0;

    for(int i = 0; i < strlen(s); i++) {
        if (strchr(pattern, s[i])) {
            answer[j] = s[i];
            j++;
        }
    }
    answer[j] = '\0';
}
void outputData(char *answer) {
    FILE *outF = fopen("D:\\University\\OAiP\\LAB3\\Goal 2\\C\\goal\\output.txt", "w");
    fprintf(outF, "%s - answer", answer);
    printf("%s - answer", answer);
    fclose(outF);
}

void main() {
    char s[101], answer[101], choice;
    int valid = 1;

    printf("This program filters out everything except numbers and arithmetic operations, and create new string. \n\n");
    do {
        printf("Enter \"C\" if you want to input data from console or \n\"F\" if you want to input data from file: \n");
        fflush(stdin);
        scanf("%c", &choice);
        switch (choice) {
            case 'C' :
                inputData(s);
                valid = 0;
                break;
            case 'F' :
                inputDataFromFile(s);
                valid = 0;
                break;
        }
    } while (valid);
    s[strlen(s) - 1] = '\0';
    creating(s, answer);
    outputData(answer);
}