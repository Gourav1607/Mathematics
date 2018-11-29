m=input(' Enter Number Of Rows : ');
n=input(' Enter Number Of Columns : ');

a=get_matrix(m,n);
b=zeros(m,1);

disp(' Input Matrix : ');
disp(a);

[R,C,N,L]=basis(a,b);

disp(' Column Space : ');
disp(C);

disp(' Null Space : ');
disp(N);

disp(' Row Space : ');
disp(R);

disp(' Left Null Space : ');
disp(L);
