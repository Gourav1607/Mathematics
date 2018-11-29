disp(' Echelon Form Matrix And Its Rank ');
m=input(' Enter Number Of Rows : ');
n=input(' Enter Number Of Columns : ');
r=0;
a=get_matrix(m,n);

disp(' Input Matrix Is : ');
disp(a);

for j=1:n-1
	for i=j+1:m
		while(a(i,j)==0)
			t(1,1:n)=a(j,1:n)
            a(j,1:n)=a(i,1:n)
            a(i,1:n)=t(1,1:n)
        end

        d=a(i,j)/a(j,j);
        a(i,1:n)=a(i,1:m)-d*a(j,1:n);
        if(a(j,j)!=0)
        	r++;
        end
    end
end

disp(' Echelon Form Matrix Is : ');
disp(a);
disp(' Rank Of Matrix Is : ');
disp(r);
