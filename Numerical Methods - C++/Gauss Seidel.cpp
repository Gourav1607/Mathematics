#include "iostream"
#include "cstdlib"
#include "iomanip"
#include "cmath"
#define SETW_DEF 5
using namespace std;

int main()
{
	system("clear");
	int n;
	cout << "\n Enter Square Matrix Size : ";
	cin >> n;

	float mat[n][n], c[n], guess[n], x[n], e[n];

	cout << "\n Enter Matrix : \n";
	for (int i = 0; i < n; i++)
	{ // Enter Matrix
		for (int j = 0; j < n; j++)
		{
			cout << " Enter Element MAT[" << i << "][" << j << "] : ";
			cin >> mat[i][j];
		}
	}
	cout << "\n Enter Augmented Matrix Elements : \n";
	for (int i = 0; i < n; i++)
	{ // Enter C (Augmented Matrix Elements)
		cout << " Enter Element C[" << i << "] : ";
		cin >> c[i];
	}
	cout << "\n Enter X (Guess) : \n";
	for (int i = 0; i < n; i++)
	{ // Enter Guess
		cout << " Enter Element Guess[" << i << "] : ";
		cin >> guess[i];
	}

	int z = 0;
	do
	{
		for (int i = 0; i < n; i++)
		{ // Calcualting X[i]
			x[i] = c[i];
			for (int j = 0; j < n; j++)
			{
				if (i != j)
					x[i] -= mat[i][j] * guess[j];
			}
			x[i] /= mat[i][i];
			e[i] = fabs(guess[i] - x[i]) / x[i];
			guess[i] = x[i]; // Changing Guess Value For New Calculated X
		}

		cout << "\n X[i] Elements For Iteration " << z + 1 << " : \n";
		for (int i = 0; i < n; i++)
		{
			cout << "   X[" << i << "] : " << setw(SETW_DEF) << x[i];
			cout << "   Guess[" << i << "] : " << setw(SETW_DEF) << guess[i];
			cout << "   Error[" << i << "] : " << setw(SETW_DEF) << e[i];
			cout << endl;
		}
		z++;
	} while ((e[0] > 0.0001 || e[1] > 0.0001 || e[2] > 0.0001) && z < 100);
	cout << endl;
	return 0;
}
