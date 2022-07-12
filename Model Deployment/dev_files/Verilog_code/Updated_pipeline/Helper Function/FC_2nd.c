#include <stdio.h>
#include <stdlib.h>

int main(){
    int input[17];

    printf("Enter data:\n");

    for (int i = 0; i < 17; i ++){
        scanf("%d", &input[i]);
    }

    printf("Here are the data:\n");
    
    // Initialise Write to a text file
    FILE *out_file = fopen("Output.txt", "w");
    if (out_file == NULL){
        printf("Error!!!\n");
        return 0;
    }

    // Bias
    if (input[0] < 0){
        fprintf(out_file, "RAM_0[0] = -16'd%d;\n", abs(input[0]));
    }else{
        fprintf(out_file, "RAM_0[0] = 16'd%d;\n", input[0]);
    }

    // Weights
    for (int i = 0; i < 16; i += 5){
        // Weight 1
        if (i+1 < 17){
            if (input[i+1] < 0) {
                fprintf(out_file, "RAM_1[%d] = -16'd%d;\n", i/5, abs(input[i+1]));
            }else{
                fprintf(out_file, "RAM_1[%d] = 16'd%d;\n", i/5, input[i+1]);
            }
        } else {
            fprintf(out_file, "RAM_1[%d] = 16'd0;\n", i/5);
        }

        // Weight 2
        if (i+2 < 17){
            if (input[i+2] < 0) {
                fprintf(out_file, "RAM_2[%d] = -16'd%d;\n", i/5, abs(input[i+2]));
            }else{
                fprintf(out_file, "RAM_2[%d] = 16'd%d;\n", i/5, input[i+2]);
            }
        } else {
            fprintf(out_file, "RAM_2[%d] = 16'd0;\n", i/5);
        }

        // Weight 3
        if (i+3 < 17){
            if (input[i+3] < 0) {
                fprintf(out_file, "RAM_3[%d] = -16'd%d;\n", i/5, abs(input[i+3]));
            }else{
                fprintf(out_file, "RAM_3[%d] = 16'd%d;\n", i/5, input[i+3]);
            }
        } else {
            fprintf(out_file, "RAM_3[%d] = 16'd0;\n", i/5);
        }

        // Weight 4
        if (i+4 < 17){
            if (input[i+4] < 0) {
                fprintf(out_file, "RAM_4[%d] = -16'd%d;\n", i/5, abs(input[i+4]));
            }else{
                fprintf(out_file, "RAM_4[%d] = 16'd%d;\n", i/5, input[i+4]);
            }
        } else {
            fprintf(out_file, "RAM_4[%d] = 16'd0;\n", i/5);
        }

        // Weight 5
        if (i+5 < 17){
            if (input[i+5] < 0) {
                fprintf(out_file, "RAM_5[%d] = -16'd%d;\n", i/5, abs(input[i+5]));
            }else{
                fprintf(out_file, "RAM_5[%d] = 16'd%d;\n", i/5, input[i+5]);
            }
        } else {
            fprintf(out_file, "RAM_5[%d] = 16'd0;\n", i/5);
        }
    }

    return 0;
}
