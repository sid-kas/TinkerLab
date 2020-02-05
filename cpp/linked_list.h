#include <iostream>
#include <string>

using namespace std;

// Interface
struct node
{
    /* data */
    int index;
    string name;
    node *prev;
    node *next;
} *start, *prevNode;

node* create(int, string);
bool insert(node*);
bool insert(node*, int);
void display(node*);
node* remove();
node* remove(int);
bool get(int);