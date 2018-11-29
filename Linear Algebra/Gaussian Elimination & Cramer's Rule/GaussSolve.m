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
