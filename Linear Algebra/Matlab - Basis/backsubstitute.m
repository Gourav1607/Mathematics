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
