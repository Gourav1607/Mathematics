function [mat] = get_matrix(m, n)
	mat = zeros(m, n); 
	for i = 1:m
		for j = 1:n
			mat(i, j) = input([' Enter Element At ',num2str(i),',',num2str(j),' : ']);
		end
	end
end


function [U, r, p, b] = EchelonForm(A,f)
	U=A;
	b=f;
	l=1;
	[m,n] = size(U);
	pii=1; pij  = 1; r = 0;
	while 0==0
		if U(pii,pij) == 0
			flag = 0;
			for k=pii+1 : m
				if U(k,pij)~=0
					flag = 1;
					break;
				end
			end % for
			if flag == 0
				flag=0;
				pij= pij+1;
				if pij > n
					break;
				else
					continue;
				end
			else
				tmp = U (k, 1:n);
				U(k, 1:n) = U(pii, 1:n);
				U(pii, 1:n) = tmp;
				temp=b(k);
				b(k)=b(pii);
				b(pii)=temp;
			end
		end % if
		p(l,1)=pij;
		l=l+1;
		r = r+1;

		for j = pii + 1:m
			ml = U(j,pij) / U(pii,pij);
			U(j,1:n) = U(j,1:n) - ml*U(pii,1:n);
			b(j)=b(j)-ml*b(pii);
		end % for loop
		pii = pii +1;
		pij = pij+1;
		if (pii >m || pij >n)
			break;
		end % if
	end % while
end


function x=BackSubstitute(A,p,b,x)
	%A is U and b=c    so Ux=c;
	[m,n]=size(A);
	[pn,pm]=size(p);
	tmp=zeros(1,1);
	%nargin is inbuilt variable that defines how many variables are passed as arguement to function
	if nargin==3
		x=zeros(n,1);
	end
	for i=pn:-1:1
		tmp=b(i);
		for j=n:-1:i+1
			tmp=tmp-A(i,j)*x(j);
		end
		x(p(i))=tmp/A(i,p(i,1));
	end
end


function [x]=GaussSolve(a,b);
	[m,n]=size(a);
	x=zeros(n,1);
	[U,r,p,b1]=EchelonForm(a,b);
	t=1;

	if m==n && r==m
		disp('Unique solution');
		x=BackSubstitute(U,p,b1,x);
	elseif r==m &&r<n
		disp(' Infinite many solution');
		x=BackSubstitute(U,p,b1,x);
	elseif r<m && r<=n
		flag=1;
		for k=r+1:m
			if b1(k)~=0
	 			flag=0;
				break;
			end
		end
		if flag==0
			disp('No solution');
		else
			disp('Infinite many solutions');
			x=BackSubstitute(U,p,b1,x);
		end
	end
end


function [d] = Det(a)
	[m,n]=size(a);
	c=zeros(m-1,n-1);
	d=0;

	if m==1
		d= a(1,1);
	else
		for j=1:n
			if j==1
				c= a(2:n,2:n);
			else
				c= a(2:n,[1:j-1,j+1:n]);
			end
			d= d + (a(1,j)*((-1)^(1+j))) * Det(c);
		end
	end
end


function [x] = CramerSolve(a,b)
	[m,n] = size(a);
	x=zeros(m,1);
	if m~=n
		disp(' Not A Square Matrix : Cant Find Solution ');
	else
		d=Det(a);
		if d==0
			disp(' Singular Matrix : Cant Find Solution ');
		else
			for j=1:n
				c=a;
				c(1:n,j)=b;
				x(j)=Det(c)/(d);
			end
		end
	end
end


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