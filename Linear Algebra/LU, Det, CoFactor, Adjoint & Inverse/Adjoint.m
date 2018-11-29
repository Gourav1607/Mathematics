function adj=Adjoint(a);

	[m,n]=size(a);

	adj=zeros(m,n);
	c=zeros(m,n);

	c=CoFactor(a);

	for i=1:n
		for j=1:m
			adj(i,j)=c(j,i);
		end
	end
end
