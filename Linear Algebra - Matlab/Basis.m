function [ mat ] = get_matrix(m,n)
	mat=zeros(m,n);
	for i=1:m
		for j=1:n
			mat(i,j)=input([' Enter Element At ',num2str(i),',',num2str(j),' : ']);
		end
	end
end


function [ L,U,r,p,b] = echelonform3(A,f)
	U=A;
	b=f;
	l=1;
	[m,n] = size(U);
	L=zeros(m,m);
	for i=1:m
		L(i,i)=1;
	end
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
				t=L(k,1:k-1);
				L(k,k-1)=L(pii,k-1);
				L(pii,k-1)=t;
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
			L(j,pij)=ml;
		end % for loop
		pii = pii +1;
		pij = pij+1;
		if (pii >m || pij >n)
			break;
		end % if
	end % while
	p=p';
end


function x=backsubstitute(A,p,b,x)
% A is U and b=c    so Ux=c;
	[m,n]=size(A);
	[pn,pm]=size(p);
%nargin is inbuilt variable that defines how many variables are passed as arguement to function
	tmp=zeros(1,1);
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


function [R,C,N,L] = basis(A,b)
    [m,n]=size(A);
    [L1,U,r,p] = echelonform3(A,b);
    R=U(1:r,1:n);
    R=R';

    for(i=1:r)
        C(1:m,i) = A(1:m,p(i));
    end

    j=1;
    for(i=r+1:m)
        L(j++,1:m)=L1(i,1:m);
    end

    if(r==m)
        disp('Left Null Space is only zero vector');
        L=0;
    else
        L=L';
    end

    t=1;
    b=zeros(m,1);

    for(i=1:n)
        flag=0;
        for(j=1:r)
            if(i==p(j))
                flag=1;
		        break;
            end
        end
        if(flag==1)
            continue;
        else
            X=zeros(n,1);
            X(i,1)=1;
            X=backsubstitute(U,p,b,X);
            N(1:n,t++)=X;
        end
    end
end


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
