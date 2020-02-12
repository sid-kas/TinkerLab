#include<iostream>

void main() {

    using namespace std;
    int size = 10;

    void print_array(int arr[]) {
        int s = sizeof(*arr)/sizeof(arr[0]);
        for (int i=0; i<size; i++){
            cout << arr[i]<< "\n";
        }
        cout << "\n" << "========" << "\n \n";
    }

    void dyn_pointer() {
        int a = 10;
        int *pa[5];
        
        int* dyn = new int[size];
        
        for (int i=0; i<6; i++) {
            dyn[i] = i+1;
        }
        
        print_array(dyn);
        
        delete[]dyn;
        
        print_array(dyn);
        
        for (int i=0; i<8; i++) {
            dyn[i] = i+1;
        }
        
        print_array(dyn);
    }

    void linked_list() {
        
    }

    int main()
    {
        dyn_pointer(
            );
        
    }
}
