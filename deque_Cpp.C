#include <iostream>
using namespace std;

const int SIZE = 10 ;
int deque[SIZE] ;
int front = -1  , back = 10 , used = 0 ;


void push_front(int val){
    if (used == SIZE) {
        cout << "Deque is Full :( \n" ;
        return;
    }
    deque[front] = val ;
    front = front - 1 ;
    used ++ ;
}


void push_back(int val){
    if (used == SIZE) {
        cout << "Deque is Full :( \n" ;
        return;
    }
    deque[back] = val ;
    back = back + 1 ;
    used ++ ;
}

void pop_front(){
    if (used == 0) {
        cout << "Deque is Empty :( \n" ;
        return;
    }
    front = front + 1 ;
    used -- ;
}
void pop_back(){
    if (used == 0) {
        cout << "Deque is Empty :( \n" ;
        return;
    }
    back = back - 1 ;
    used -- ;
}


void display(){
        cout << "Elements : {" ;
        for (int i = front - 1; ~i ; --i) {
            cout << deque[i] << ' ' ;
        }
        for (int i = SIZE - 1; i > back; --i) {
            cout << deque[i] << ' ' ;
        }ِ
        cout << "}\n" ;
}



int main() {
    display() ;
}

