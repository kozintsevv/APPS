#include <stdio.h>
// Functions
void count_even_numbers();
void move_negative_numbers();
void count_vowel();
void replace_third_vowel();




// Variables
int g_int_outup;
int g_int_array[15] = { -3, -8, 80, 2710, 32, 439, 9099, 10, 77, -273, 2, 22222, 0, -23, 23};
char g_char_array[32] = "testovaci pole pro cv2";
int g_neg_val_array[15];
int index;
int vowel_count;

int main(){
    count_even_numbers();
    move_negative_numbers();
    count_vowel();
    replace_third_vowel();

    printf( "g_int_outup: %d\n", g_int_outup);
    printf("g_neg_val_array[%d]={",index);
    for(int i=0;i<index;i++){
        printf("%d",g_neg_val_array[i]);
        if(i!=index-1){
            printf(", ");
        }
        else{
            printf("}\n");
        }
    }
    printf("vowel_count: %d\n",vowel_count);

    printf("g_char_array[32]={");
    for(int i=0;i<32;i++){
        if(i!=31){
            printf("%c",g_char_array[i]);
        }else{
            printf("}\n");
        }

    }
}