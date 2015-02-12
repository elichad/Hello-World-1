#include <iostream>
using namespace std;

#ifndef FLOW123D_VARIABLE
    #define FLOW123D_VARIABLE "[variable not set]"
#endif

#ifndef FLOW123D_COMPILER_FLAGS_
    #define FLOW123D_COMPILER_FLAGS_ "[variable not set]"
#endif

int main (int argc, char **argv) {
  cout << "This is main app" << endl;
  cout << "FLOW123D_VARIABLE       : " << FLOW123D_VARIABLE 		<< endl;
  cout << "FLOW123D_COMPILER_FLAGS_: " << FLOW123D_COMPILER_FLAGS_	<< endl;
}