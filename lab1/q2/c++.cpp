#include <iostream>
using namespace std;

int main() {
    float k, i;
    float j = 15;
    for (k = (j+13)/27; k <= 10; k=k+1.2) {
        i=3*k-1;
        cout << "i = " << i << "\n";
        cout << "k = " << k << "\n";
        cout << "j = " << j << "\n";
    }
    return 0;
}

