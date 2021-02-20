#include "iostream"
#include "cmath"
using namespace std;

double f(double fx)
{
	double x;
	x = (fx * fx * fx) - 4 * fx * fx - 3;
	return x;
}

int main()
{
	double x1, x2, sig;
	int i = 0;
	cout << "Enter the smaller guess : ";
	cin >> x1;
	cout << "Enter the larger guess : ";
	cin >> x2;
	cout << "enter th sig number : \n";
	cin >> sig;
	if (f(x1) == 0)
		cout << "Root is " << endl
			 << x1;
	else if (f(x2) == 0)
		cout << "Root is " << endl
			 << x2;

	do
	{
		double x3, err;
		err = x3;
		x3 = x2 - ((f(x2) * (x2 - x1)) / (x2 - x1));
		cout << "x1 : " << x1 << "\t| x2 : " << x2 << "\t| x3 : " << x3
			 << "\t| f(x1) : " << f(x1) << "\t| f(x2) : " << f(x2)
			 << "\t| f(x3) : " << f(x3) << endl;
		x1 = x2;
		x2 = x3;
		i++;
		if (abs((x3 - err) / x3) < sig)
			break;
	} while (i <= 10);
	return 0;
}
