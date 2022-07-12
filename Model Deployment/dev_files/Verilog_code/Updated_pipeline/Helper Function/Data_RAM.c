#include <stdio.h>

int main(){
    for (int i = 0; i < 48; i ++){
        printf("reg [Bit_width - 1 : 0] RAM_%d [0 : RAM_Depth - 1];\n", i);
    }
}