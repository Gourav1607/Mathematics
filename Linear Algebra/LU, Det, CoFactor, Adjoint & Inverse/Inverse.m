function [x]=Inverse(a);

	[m,n]=size(a);
	adj=zeros(m,n);
	x=zeros(m,n);

	adj=Adjoint(a);
	d=Det(adj);

	if d==0
		disp(' Determinant Zero : Inverse Doesnt Exist ');
		dbstop;
	else
		for i=1:m
		    for j=1:n
			x(i,j)=adj(i,j)/d;
		end
	end

end
