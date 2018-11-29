#include "iostream"
#include "cmath"
using namespace std;

double f(double fx) {
	double x;
	x = (fx * fx * fx) - 1;
	return x;
}

int main() {
	double sig = 0.000001;
	double xu;
	double xl;
	cout << "enter first guess : " << endl;
	cin >> xl;
	cout << "enter second guess : " << endl;
	cin >> xu;

	int i = 0;
	if (f(xl) == 0) {
		cout << "root : " << xl << endl;
	} else if (f(xu) == 0) {
		cout << "root : " << xu << endl;
	} else if (f(xu) * f(xl) > 0) {
		cout << "please enter valid guess!";
	}

	do {
		double xm = (xu + xl) / 2.0;
		double ym = xm;
		cout << "xl=" << xl << "\t| xu=" << xu << "\t| xm=" << xm << "\t";
		cout << "| f(xl)=" << f(xl) << "\t| f(xu)=" << f(xu) << "\t| f(xm)=";
		cout << f(xm) << endl << endl;

		if (f(xl) * f(xm) < 0) {
			xu = xm;
		} else if (f(xu) * f(xm) < 0) {
			xl = xm;
		}

		if (abs((ym - xm) / xm) > sig) {
			break;
		}
		i++;
	} while (i <= 15);
	return 0;
}
