#include "iostream"
#include "iomanip"
#include "cstdlib"
#include "stdlib.h"
#include "myswap.h"

#define SETW_DEF 10
using namespace std;

int main()
{
	system("clear");

	int n;
	cout << "\n Enter Square Matrix Size : ";
	cin >> n;

	float mat[n][n], b[n];

	for (int i = 0; i < n; i++)
	{ // Enter Matrix
		for (int j = 0; j < n; j++)
		{
			cout << " Enter Element MAT[" << i << "][" << j << "] : ";
			cin >> mat[i][j];
		}
	}
	for (int i = 0; i < n; i++)
	{ // Enter B (Augmented Matrix)
		cout << " Enter Element B[" << i << "] : ";
		cin >> b[i];
	}

	for (int i = 0; i < n; i++)
	{ // Print Matrix
		for (int j = 0; j < n; j++)
		{
			cout << " " << setw(SETW_DEF) << mat[i][j];
		}
		cout << " | " << setw(SETW_DEF) << b[i] << " | ";
		cout << endl;
	}

	for (int i = 0; i < n; i++)
	{ // For Every Diagonal Element
		if (mat[i][i] == 0)
		{ // If The Index Is 0 Then Swap
			int temp = i;
			while (mat[temp][i] == 0)
			{ // Check Until Non-Zero Value Is Found
				temp++;
			}
			for (int j = 0; j < n && temp != i; j++)
			{ // Swap With Non-Zero Valued Row
				swap(mat[i][j], mat[temp][j]);
				swap(b[i], b[temp]);
			}
		}
		// Now The Value Is Non-Zero

		float a = mat[i][i]; // After Dividing Itself, It Will Become One.. So Store It Before Hand To Retain Its Value
		for (int j = 0; j < n; j++)
		{ // Dividing Row By Diagonal Element
			mat[i][j] /= a;
		}
		b[i] /= a;
		// Now The Row Is Divided By Diagonal Element

		for (int j = 0; j < n; j++)
		{ // For Every Row
			if (i != j && mat[j][i] != 0.0)
			{	// Check If The Element Is Not Already Zero
				// And It Is Not The Same As The Row With Diagonal Element
				a = mat[j][i];
				for (int k = 0; k < n; k++)
				{ // For Every Element Of The Jth Row
					mat[j][k] = mat[j][k] - a * mat[i][k];
				}
				b[j] = b[j] - a * b[i];
			}
		}
		cout << endl;
		for (int i = 0; i < n; i++)
		{ // Print Matrix
			for (int j = 0; j < n; j++)
			{
				cout << " " << setw(SETW_DEF) << mat[i][j];
			}
			cout << " | " << setw(SETW_DEF) << b[i];
			cout << endl;
		}
	}

	cout << endl
		 << " Final Augmented Matrix : " << endl;
	for (int i = 0; i < n; i++)
	{ // Print Matrix
		for (int j = 0; j < n; j++)
		{
			cout << " " << setw(SETW_DEF) << mat[i][j];
		}
		cout << " | " << setw(SETW_DEF) << b[i];
		cout << endl;
	}

	cout << "\n Solution Is : "; // Print Solution
	for (int i = 0; i < n; i++)
	{
		cout << " " << setw(SETW_DEF) << b[i];
	}
	cout << endl
		 << endl;
	return 0;
}
