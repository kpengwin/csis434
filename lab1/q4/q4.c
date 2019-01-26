#include <stdio.h>

int main() {
    int j = -3;
    for (int i=0; i<3; i++) {
        printf("i = %d\n",i);
        printf("j = %d\n",j);
        if ( (j+2) == 2 || (j+2)==3 ) {
            j--; 
        } else if ((j+2) == 0) {
            j += 2;
        } else {
            j =0;
        }
        if (j >0) { i=3; }
        j = 3-i;
    }

    return 0;
}
