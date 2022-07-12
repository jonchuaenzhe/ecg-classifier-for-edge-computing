#include <stdio.h>
#include <stdlib.h>

int main(){
    int input[16][33];

    printf("Enter data:\n");

    for (int i = 0; i < 16; i ++){
        for (int j = 0; j < 33; j ++){
            scanf("%d", &input[i][j]);
        }
    }

    printf("Here are the data:\n");
    
    // Initialise Write to a text file
    FILE *out_file = fopen("Output.txt", "w");
    if (out_file == NULL){
        printf("Error!!!\n");
        return 0;
    }

    // print the bias
    for (int i = 0; i < 16; i ++){
        if (input[i][0] < 0) {
            fprintf(out_file, "RAM_0[%d] = -16'd%d;\n", i, abs(input[i][0]));
        }else{
            fprintf(out_file, "RAM_0[%d] = 16'd%d;\n", i, input[i][0]);
        }
    }

    // print the weights
    for (int i = 0; i < 16; i ++){
        for (int j = 0; j < 32; j += 5){

            // Weight 1
            if (j + 1 < 33){
                if (input[i][j + 1] < 0) {
                    fprintf(out_file, "RAM_1[%d] = -16'd%d;\n", i * 7 + (j / 5), abs(input[i][j + 1]));
                }else{
                    fprintf(out_file, "RAM_1[%d] = 16'd%d;\n", i * 7 + (j / 5), input[i][j + 1]);
                }
            } else {
                fprintf(out_file, "RAM_1[%d] = 16'd0;\n", i * 7 + (j / 5));
            }

            // Weight 2
            if (j + 2 < 33){
                if (input[i][j + 2] < 0) {
                    fprintf(out_file, "RAM_2[%d] = -16'd%d;\n", i * 7 + (j / 5), abs(input[i][j + 2]));
                }else{
                    fprintf(out_file, "RAM_2[%d] = 16'd%d;\n", i * 7 + (j / 5), input[i][j + 2]);
                }
            } else {
                fprintf(out_file, "RAM_2[%d] = 16'd0;\n", i * 7 + (j / 5));
            }


            // Weight 3
            if (j + 3 < 33){
                if (input[i][j + 3] < 0) {
                    fprintf(out_file, "RAM_3[%d] = -16'd%d;\n", i * 7 + (j / 5), abs(input[i][j + 3]));
                }else{
                    fprintf(out_file, "RAM_3[%d] = 16'd%d;\n", i * 7 + (j / 5), input[i][j + 3]);
                }
            } else {
                fprintf(out_file, "RAM_3[%d] = 16'd0;\n", i * 7 + (j / 5));
            }

            // Weight 4
            if (j + 4 < 33){
                if (input[i][j + 4] < 0) {
                    fprintf(out_file, "RAM_4[%d] = -16'd%d;\n", i * 7 + (j / 5), abs(input[i][j + 4]));
                }else{
                    fprintf(out_file, "RAM_4[%d] = 16'd%d;\n", i * 7 + (j / 5), input[i][j + 4]);
                }
            } else {
                fprintf(out_file, "RAM_4[%d] = 16'd0;\n", i * 7 + (j / 5));
            }

            // Weight 5
            if (j + 5 < 33){
                if (input[i][j + 5] < 0) {
                    fprintf(out_file, "RAM_5[%d] = -16'd%d;\n", i * 7 + (j / 5), abs(input[i][j + 5]));
                }else{
                    fprintf(out_file, "RAM_5[%d] = 16'd%d;\n", i * 7 + (j / 5), input[i][j + 5]);
                }
            } else {
                fprintf(out_file, "RAM_5[%d] = 16'd0;\n", i * 7 + (j / 5));
            }
        }
    }
    
    return 0;
}
