#include <iostream>
using namespace std;

int digits(int i)
{
    int total = 0;
    while (i != 0)
    {
        total += 1;
        i /= 10;
    }
    return total;
}
int expt(int i, int j)
{
    int total = 1;
    while (j != 0)
    {
        total *= i;
        j -= 1;
    }
    return total;
}
int penta(int i, int j)
{
    int total = 0;
    int counter = 1;
    while (counter != j+1)
    {
        total = (total * (expt(10, digits(counter*i)))) + (i * counter);
        counter += 1;
    }
    return total;
}

int Unique(int i)
{
    int a[12];
    for (int j = 0; j < 12; j++)
    {
        a[j] = -1;
    }
    int k = 0;
    int temp;
    while ( i != 0)
    {
        temp = i %10;
        a[k] = temp;
        i /= 10;
        k += 1;
    }
    for (int i = 0; i < 12; i++)
    {
        for (int j = i+1; j < 9; j++)
        {
            if (a[i] == a[j] && a[i] != -1)
            {
                return 0;
            }
        }
    }
    return 1;
}
int main()
{
    int largest = 0;
    for (int i = 9123; i < 9328; i++)
    {
        for (int j = 2; j < 3 ; j++)
        {
            int total = penta(i,j);
            if (total < 1000000000 && total > 918273645 && total > largest && Unique(total) && Unique(i))
            {
                largest = total;
            }
        }
    }
    cout << "Largest is: " << largest << endl;
}

