#include <stdio.h>

int main (){
    // for (int i = 0; i < 32; i ++){
    //     printf("%d : RAM_%d[Write_Width] <= data_in;\n", i, i);
    // }

    // Initialise Write to a text file
    FILE *out_file = fopen("Output.txt", "w");
    if (out_file == NULL){
        printf("Error!!!\n");
        return 0;
    }

    for (int i = 0; i < 32; i ++){
        fprintf(out_file, "%d:\n", i);
        fprintf(out_file, "\tbegin\n");
        fprintf(out_file, "\t\tdata_out_0 <= RAM_%d[Read_Width];\n", i);
        fprintf(out_file, "\t\tdata_out_1 <= (Read_Width < 256 - 1) ? RAM_%d[Read_Width + 1] : 0;\n", i);
        fprintf(out_file, "\t\tdata_out_2 <= (Read_Width < 256 - 2) ? RAM_%d[Read_Width + 2] : 0;\n", i);
        fprintf(out_file, "\t\tdata_out_3 <= (Read_Width < 256 - 3) ? RAM_%d[Read_Width + 3] : 0;\n", i);
        fprintf(out_file, "\t\tdata_out_4 <= (Read_Width < 256 - 4) ? RAM_%d[Read_Width + 4] : 0;\n", i);
        fprintf(out_file, "\tend\n");
\
    }
    return 0;
}