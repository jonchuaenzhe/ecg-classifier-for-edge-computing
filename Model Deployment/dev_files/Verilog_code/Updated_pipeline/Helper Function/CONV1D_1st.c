#include <stdio.h>
#include <stdlib.h>

int main(){
    int input[8][6];

    printf("Enter data:\n");

    for (int i = 0; i < 8; i ++){
        for (int j = 0; j < 6; j ++){
            scanf("%d", &input[i][j]);
        }
    }

    printf("Here are the data:\n");
    
    // Initialise Write to a text file
    FILE *out_file = fopen("CONV1D_1st.txt", "w");
    if (out_file == NULL){
        printf("Error!!!\n");
        return 0;
    }

    for (int i = 0; i < 8; i ++){
        for (int j = 0; j < 6; j ++){
            if (input[i][j] < 0) {
                fprintf(out_file, "RAM_%d[%d] = -16'd%d;\n", j, i, abs(input[i][j]));
            }else{
                fprintf(out_file, "RAM_%d[%d] = 16'd%d;\n", j, i, input[i][j]);
            }
        }
    }
    
    return 0;
}
