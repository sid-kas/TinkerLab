#include "linked_list.h"

// Functions

node* create(int index, string name){
    node *temp = new node;
    temp->index = index;
    temp->name = name;
    return temp;
}

bool insert(node* newNode){
    // cout << convertToString(newNode) << endl;
    if(start==NULL) {
        start = newNode;
    }
    else
    {
        if (prevNode == NULL) {
            start->next = newNode;
        }
        prevNode->next = newNode;
        newNode->prev = prevNode;
    }
    prevNode = newNode;
    return true;
}

node* remove() {
    if (prevNode==NULL) {
        return new node;
    } else
    {   
        node *result = prevNode;
        delete prevNode;
        prevNode = result->prev;
        return result;
    }
    return NULL;
}

void display(node* newnode) {
    node *temp = prevNode;
    string result = " ]";
    while (true) {
        if(temp->prev == NULL) {
            result = "[ " + result;
            cout << result << endl;
            return;
        }
        result = "[" + to_string(temp->index) + ","+ temp->name + "]" + result;
        // cout << "[" << temp->index << ", " << temp->name << "]" << endl;
        temp = temp->prev;
    }
}


// Main code
int main() {
    for (int i = 0; i < 5; i++)
    {
        node *newNode = create(i,"lorem");
        insert(newNode);
        display(newNode);
    }
    remove();
    
    display(prevNode);

    return 0;
}