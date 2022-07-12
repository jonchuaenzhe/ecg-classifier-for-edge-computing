#include <stdio.h>
// #include <stdint.h>
#include <math.h>
#include <stdlib.h>

// param
#define max_depth 512
#define width 3

int print_num (int);
int two_s_complement(int);

int main(){
    int depth;

    // int RAM [max_depth][width];
    int RAM[max_depth];
    int counter = 0;

    printf("Enter variable depth:\n");
    scanf("%d", &depth);

    printf("Enter integers to be converted to hex:\n");
    for (int i = 0; i < depth; i ++){
        scanf("%d", &RAM[i]);
    }
    printf("\n");
    printf("Returning hex values\n");
    for (int i = 0; i < depth; i ++){

        counter += 1;

        int a = print_num(RAM[i]);
        if (a){
            return 0;
        }

        if (counter % 5 == 0){
            printf("\n");
        }else{
            printf("\t");
        }
    }

    return 0;
    
}

int print_num (int input){
    int temp;
    int result;

    if (input < 0){
        result = two_s_complement(input);
        // printf("%d:", result);

    }else{
        result = input;
    }

    // return 0;
    if (result <= 15){
        printf("0%x", result);
    }else{
        printf("%x", result);
    }
    return 0;

}

int two_s_complement(int input){
    int temp[16];
    int intermediate_result = abs(input);
    int carry = 1;
    int result = 0;

    // flush temp with 0 first
    for (int i = 0; i < 16; i ++){
        temp[i] = 0;
    }

    // printf("Intermediate result: %d\n", intermediate_result);

    // convert input into a 16 bit binary
    for (int i = 0; intermediate_result > 0; i ++){
        temp[i] = intermediate_result % 2;
        // printf("Intermediate result: %d\n", intermediate_result);
        intermediate_result = intermediate_result / 2;
    }

    // printf("Integer to binary conversion: ");
    // for (int i = 15; i >= 0; i --){
    //     printf("%d", temp[i]);
    // }
    // printf("\n");

    // Bit flip
    for (int i = 0; i < 16; i ++){
        if (temp[i] == 0){
            temp[i] = 1;
        }else{
            temp[i] = 0;
        }
    }

    // printf("After bit flip: ");
    // for (int i = 15; i >= 0; i --){
    //     printf("%d", temp[i]);
    // }
    // printf("\n");

    // Add 1
    for (int i = 0; i < 16; i ++){
        if (carry == 0){
            break;
        }

        if (temp[i] == 0){
            temp[i] = 1;
            carry = 0;
        }else{
            temp[i] = 0;
            carry = 1;
        }
    }

    // printf("After adding 1: ");
    // for (int i = 15; i >= 0; i --){
    //     printf("%d", temp[i]);
    // }
    // printf("\n");

    // Convert back to integer
    for (int i = 0; i < 16; i ++){
        if (temp[i] != 0){
            result += (int) pow(2, i);
        }
    }

    return result % 65536; // we only want 16 bits
}