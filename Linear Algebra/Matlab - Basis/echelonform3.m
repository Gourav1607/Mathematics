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
