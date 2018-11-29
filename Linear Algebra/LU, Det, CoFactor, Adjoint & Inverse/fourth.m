ch=menu(' Choose One Of The Options Below ',' LU Decomposition ',' Determinant ',' CoFactor Form ',' Adjoint Matrix ',' Inverse ');

m=input(' Enter Number Of Rows : ');
n=input(' Enter Number Of Columns : ');

a=zeros(m,n);
l=zeros(m,n);
u=zeros(m,n);

a=get_matrix(m,n);

disp(' The Input Matrix Is : ');
disp(a);

if ch==1
	[l,u]=LUDec(a);
	disp(' The Lower Triangular Matrix Is: ');
	disp(l);
	disp(' The Upper Triangular Matrix Is: ');
	disp(u);
end
if ch==2
	disp(' Determinant Is : ');
	d=Det(a);
	disp(d);
end
if ch==3
	l=CoFactor(a);
	disp(' The CoFactor Matrix Is : ');
	disp(l);
end
if ch==4
	l=Adjoint(a);
	disp(' The Adjoint Matrix Is : ');
	disp(l);
end
if ch==5
	l=Inverse(a);
	disp(' The Inverse Matrix Is : ');
	disp(l);
end
