#include <iostream>
using namespace std;

int main() {
    int k, i;
    int j = 15;
    for (k = (j+13)/27; k <= 10; k++) {
        i=3*k-1;
        cout << "i = " << i << "\n";
        cout << "k = " << k << "\n";
        cout << "j = " << j << "\n";
    }
    return 0;
}

