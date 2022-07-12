#include <stdio.h>
#include <stdlib.h>

int main(){
    int input[8][16][4];

    printf("Enter data:\n");

    for (int i = 0; i < 8; i ++){
        for (int j = 0; j < 16; j ++){
            for (int t = 0; t < 4; t ++){
                scanf("%d", &input[i][j][t]);
            }
        }
    }

    printf("Here are the data:\n");
    
    // Initialise Write to a text file
    FILE *out_file = fopen("Output.txt", "w");
    if (out_file == NULL){
        printf("Error!!!\n");
        return 0;
    }

    for (int i = 0; i < 8; i ++){
        for (int j = 0; j < 16; j++){
            for (int t = 0; t < 4; t ++){
                if (input[i][j][t] < 0) {
                    fprintf(out_file, "RAM_%d[%d] = -16'd%d;\n", t, i*16+j, abs(input[i][j][t]));
                }else{
                    fprintf(out_file, "RAM_%d[%d] = 16'd%d;\n", t, i*16+j, input[i][j][t]);
                }
            }
        }
    }
    
    return 0;
}
