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
