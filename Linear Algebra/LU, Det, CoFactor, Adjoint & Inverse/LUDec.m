function [l,u] = LUDec(a)

	[m,n]=size(a);
	u=a;
	l=eye(m,m);
	pii=1;
	pij=1;
	r=0;

	while 1
		if u(pii,pij)==0 				% to check if pivot is zero
			flag=0;
			for k=pii+1:m
				if u(k,pij)~=0
					flag=1;
					break;
				end
			end
			if flag==0
				pij=pij+1;
					if pij>n
					    break;
					else
					    continue;
					end
				else
					tmp=u(k,1:n);
					u(k,1:n)=u(pii,1:n);
					u(pii,1:n)=tmp;
					if pii~=1
						tmp=l(k,1:k-1);
						l(k,k-1)=l(pii,k-1);
						l(pii,k-1)=tmp;
					end
				end
			end
			for j=pii+1:m; 					% loop for row reduction
				ml=u(j,pij)/u(pii,pij);
				l(j,pii)=ml;
				u(j,1:n)=u(j,1:n)-ml*u(pii,1:n);
			end
			pii=pii+1;
			pij=pij+1;
			if pii>m||pij>n
				break;
			end
	       	end
	end

end
