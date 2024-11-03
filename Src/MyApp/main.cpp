#include "pch.h"
#include "../MyStaticLibrary/MyLib.h"

using namespace std;

int main()
{
    cout << "Hello World!" << endl;
    int n = test_func();
    cout << n << endl;
    return 0;
}