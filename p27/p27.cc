#include <iostream>
#include <math.h>
using namespace std;


// helper for mainFunction
int isPrime(double num)
{
    int isprime = 1;
    for (int i = 2; i <= sqrt(num); i += 2)
    {
        if (i % 2 == 0)
        {
            i++;
        }
        if (int(num) % i == 0)
        {
            isprime = 0;
            break;
        }
    }
    return isprime;
}

int main()
{
    int counter = 0;
    int largest = 0;
    double sum = 0;
    int product = 0;
    for (int a = -999; a < 1000; a++)
    {
        for (int b = 0; b < 1000; b++)
        {
            for (int n = 0; n < 200; n++)
            {
                sum = (n*n) + (a*n) + b;
                if (sum < 0) break;
                if (isPrime(sum))
                {
                    if (n > largest)
                    {
                        largest = n;
                        product = a * b;
                    }
                }
                else
                {
                    break;
                }
            }
        }
    }
    cout << "Product of coefficients is: " << product << endl;
}
