#include <stdio.h>
// #include <stdint.h>
#include <math.h>
#include <stdlib.h>

// param
#define max_depth 512
#define width 3

int print_num(int);
int int_to_ascii(int);

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

        // if (counter % 5 == 0){
        //     printf("\n");
        // }else{
        //     printf("\t");
        // }
    }

    return 0;
    
}

int print_num (int number){

    int th, h, t, u, sign;
    if (number < 0){
        sign = 1;
    }else{
        sign = 0;
    }

    int abs_num = abs(number);

    u = abs_num % 10;
    t = (abs_num / 10) % 10;
    h = (abs_num / 100) % 10;
    th = abs_num / 1000;

    if (sign == 1) {
        printf("2D\t");
    }else{
        printf("%x\t", int_to_ascii(0));
    }

    printf("%x\t", int_to_ascii(th));
    printf("%x\t", int_to_ascii(h));
    printf("%x\t", int_to_ascii(t));
    printf("%x\t", int_to_ascii(u));

    printf("0D\n");

    // printf("%d\t", th);
    // printf("%d\t", h);
    // printf("%d\t", t);
    // printf("%d\t", u);

    return 0;
}

int int_to_ascii (int number){
    return '0' + number;
}