#include "iostream"
#include "cmath"
#include "cstdlib"
using namespace std;

double f(double fx)
{
	double x;
	x = (fx * fx * fx) - 1;
	return x;
}

double fdas(double fx)
{
	double x;
	x = 3 * fx * fx;
	return x;
}

int main()
{
	system("clear");
	double x, y;
	int i = 0;
	double sig = 0.000001;
	cout << "Enter guess : \n";
	cin >> x;
	if (f(x) == 0)
		cout << "root is : " << x << endl;

	do
	{
		if (i == 10)
			break;
		y = x - (f(x) / fdas(x));
		cout << " x = " << x << "\t| y = " << y << "\t| f(x) = " << f(x)
			 << "\t| f(y) = " << f(y) << endl;
		if (f(y) == 0)
			break;
		else
			x = y;
		i++;
	} while (abs(x - y) > 0.000001);
	return 0;
}
