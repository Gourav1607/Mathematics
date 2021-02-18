#include "iostream"
using namespace std;

int main() {
	float cord[][2] = {  //data input
			0, 0, 2, 0.18, 4, 0.45, 6, 6.3, 8, 8.4, 10, 9.6, 12, 11.8, 14, 14.3,
					16, 15.8, 18, 17.3 };
	float avgX, avgY;

	avgX = avgY = 0.0;

	for (int i = 0; i < 10; ++i) {
		/*		cout<<" Enter Data Number ("<<i<<") :";
		 cout<<" \n Enter X : ";
		 cin>>cord[i][0];
		 cout<<" Enter Y : ";
		 cin>>cord[i][1];
		 */
		cout << "\n Data Number (" << i + 1 << ") :";
		cout << "\t X : " << cord[i][0];
		cout << "\t Y :" << cord[i][1];
		avgX += cord[i][0];
		avgY += cord[i][1];
	}

	avgX /= 10;
	avgY /= 10;

	float slope = 0.0;
	float c = 0.0;
	float sumXX = 0.0;

	for (int i = 0; i < 10; i++) {
		slope += (cord[i][0] - avgX) * (cord[i][1] - avgY);
		sumXX += (cord[i][0] - avgX) * (cord[i][0] - avgX);
	}
	slope /= sumXX;

	c = avgY - slope * avgX;

	cout << "\n Intercept Is : " << c;
	cout << "\n Slope Is : " << slope << endl;

	return 0;
}
