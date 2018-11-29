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
