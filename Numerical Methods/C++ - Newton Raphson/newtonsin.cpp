#include "iostream"
#include "cmath"
#include "cstdlib"
using namespace std;

double factorial(double x) {
	double y = 1;
	if (x == 0)
		return 1;

	for (int i = 1; i <= x; i++)
		y *= i;
	return y;
}

double f(double x) { //sine series
	double sum = 0;
	int k = 2;
	for (int i = 1; i <= 40;) {
		sum += ((pow(-1, k) * (pow(x, i))) / factorial(i));
		k++;
		i += 2;
	}
	return sum;
}

double fdas(double x) { //cosine series
	double sum = 0;
	int k = 2;
	for (int i = 0; i <= 40;) {
		sum += ((pow(-1, k) * (pow(x, i))) / factorial(i));
		k++;
		i += 2;
	}
	return sum;
}

int main() {
	double x, y;
	int i = 0;
	double sig = 0.000001;
	cout << "Enter guess : \n";
	cin >> x;
	if (f(x) == 0)
		cout << "root is : " << x << endl;

	do {
		double y;
		if (i == 20)
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
