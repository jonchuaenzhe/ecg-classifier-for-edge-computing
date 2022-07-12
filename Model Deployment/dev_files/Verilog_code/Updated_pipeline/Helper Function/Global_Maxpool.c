#include <stdio.h>

int main(){
    // Initialise Write to a text file
    FILE *out_file = fopen("Output.txt", "w");
    if (out_file == NULL){
        printf("Error!!!\n");
        return 0;
    }


    for (int i = 0; i < 32; i ++){
        fprintf(out_file, "%d:\n", i);
        fprintf(out_file, "\tbegin\n");
        fprintf(out_file, "\t\t// The first data is always valid\n");
        fprintf(out_file, "\t\tRead_data_out_0 <= RAM_%d[Read_Width];\n", i);
        fprintf(out_file, "\n");
        fprintf(out_file, "\t\tcase(Global_MaxPool_State_Machine)\n");
        fprintf(out_file, "\t\t\t4'b0001:\n");
        fprintf(out_file, "\t\t\t\tbegin\n");
        fprintf(out_file, "\t\t\t\t\tRead_data_out_1 <= (Read_Width < 256 - 1) ? RAM_%d[Read_Width + 1] : 0;\n", i);
        fprintf(out_file, "\t\t\t\t\tRead_data_out_2 <= (Read_Width < 256 - 1) ? RAM_%d[Read_Width + 1] : 0;\n", i);
        fprintf(out_file, "\t\t\t\t\tRead_data_out_3 <= (Read_Width < 256 - 1) ? RAM_%d[Read_Width + 1] : 0;\n", i);
        fprintf(out_file, "\t\t\t\t\tRead_data_out_4 <= (Read_Width < 256 - 1) ? RAM_%d[Read_Width + 1] : 0;\n", i);
        fprintf(out_file, "\t\t\t\tend\n");
        fprintf(out_file, "\t\t\t4'b0010:\n");
        fprintf(out_file, "\t\t\t\tbegin\n");
        fprintf(out_file, "\t\t\t\t\tRead_data_out_1 <= (Read_Width < 52 - 1) ? RAM_%d[Read_Width + 1] : 0;\n", i);
        fprintf(out_file, "\t\t\t\t\tRead_data_out_2 <= (Read_Width < 52 - 1) ? RAM_%d[Read_Width + 1] : 0;\n", i);
        fprintf(out_file, "\t\t\t\t\tRead_data_out_3 <= (Read_Width < 52 - 1) ? RAM_%d[Read_Width + 1] : 0;\n", i);
        fprintf(out_file, "\t\t\t\t\tRead_data_out_4 <= (Read_Width < 52 - 1) ? RAM_%d[Read_Width + 1] : 0;\n", i);
        fprintf(out_file, "\t\t\t\tend\n");
        fprintf(out_file, "\t\t\t4'b0100:\n");
        fprintf(out_file, "\t\t\t\tbegin\n");
        fprintf(out_file, "\t\t\t\t\tRead_data_out_1 <= (Read_Width < 11 - 1) ? RAM_%d[Read_Width + 1] : 0;\n", i);
        fprintf(out_file, "\t\t\t\t\tRead_data_out_2 <= (Read_Width < 11 - 1) ? RAM_%d[Read_Width + 1] : 0;\n", i);
        fprintf(out_file, "\t\t\t\t\tRead_data_out_3 <= (Read_Width < 11 - 1) ? RAM_%d[Read_Width + 1] : 0;\n", i);
        fprintf(out_file, "\t\t\t\t\tRead_data_out_4 <= (Read_Width < 11 - 1) ? RAM_%d[Read_Width + 1] : 0;\n", i);
        fprintf(out_file, "\t\t\t\tend\n");
        fprintf(out_file, "\t\t\t4'b1000:\n");
        fprintf(out_file, "\t\t\t\tbegin\n");
        fprintf(out_file, "\t\t\t\t\tRead_data_out_1 <= RAM_%d[1];\n", i);
        fprintf(out_file, "\t\t\t\t\tRead_data_out_2 <= RAM_%d[2];\n", i);
        fprintf(out_file, "\t\t\t\t\tRead_data_out_3 <= 0;\n");
        fprintf(out_file, "\t\t\t\t\tRead_data_out_4 <= 0;\n");
        fprintf(out_file, "\t\t\t\tend\n");
        fprintf(out_file, "\t\t\tdefault:\n");
        fprintf(out_file, "\t\t\t\tbegin\n");
        fprintf(out_file, "\t\t\t\t\tRead_data_out_1 <= 0;\n");
        fprintf(out_file, "\t\t\t\t\tRead_data_out_2 <= 0;\n");
        fprintf(out_file, "\t\t\t\t\tRead_data_out_3 <= 0;\n");
        fprintf(out_file, "\t\t\t\t\tRead_data_out_4 <= 0;\n");
        fprintf(out_file, "\t\t\t\tend\n");
        fprintf(out_file, "\t\tendcase\n");
        fprintf(out_file, "\tend\n");
    }
    return 0;
}