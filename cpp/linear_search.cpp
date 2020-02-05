#include <iostream>
#include <string>
// #include <stdlib.h>
#include <ctime>
#include <cstdlib>
// #include <random>



using namespace std;

int linearSearch(int [], int, int );

int linearSearch(int inputArray[], int arraySize, int searchElement) {
    for (int i = 0; i < arraySize; i++)
    {
        if (inputArray[i] == searchElement) {
            return i;
        }
    }
    return -1;
}

int main() {
    srand((unsigned) time(0));
    cout << rand() << endl;

}