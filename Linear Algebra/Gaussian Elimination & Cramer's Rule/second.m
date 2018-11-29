ch=menu(' Gaussian Elimination && Cramers Rule ',' Solve By Cramers Rule ',' Solve By Gaussian Elimination ');

m=input(' Enter Number Of Rows : ');
n=input(' Enter Number Of Columns : ');

disp(' Enter Matrix A : ');
a=get_matrix(m,n);
disp(' Enter Matrix b : ');
b=get_matrix(m,1);

if ch==1
	x=CramerSolve(a,b);
else
	x=GaussSolve(a,b);
end

disp(' The solution is : ');
disp(x);
