#include <iostream>
using namespace std;

int main() {
  bool x = true;
  bool y = false;

  if (x<y) {
    cout << "True is less than false.\n";
  } else if (y < x) {
    cout << "False is less than true.\n";
  } else {
    cout << "Neither true nor false is greater.\n";
  }
  return 0;
}
