function [c] = CoFactor(a)
    [m n]=size(a);
    c=zeros(m,n);
    temp=a;

    for i=1:m
        for j=1:n
            temp([i],:)=[];
            temp(:,[j])=[];
            c(i,j) = ((-1)^(i+j))*Det(temp);
            temp=a;
        end
    end

end


function [B]=cofactor1(a,i,j);
    [m,n]=size(a);
    B=a([1:i-1,i+1:m],[1:j-1,j+1:n]);
end


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


function [ mat ] = get_matrix(m,n)
	mat=zeros(m,n); 
	for i=1:m
		for j=1:n
			mat(i,j)=input([' Enter Element At ',num2str(i),',',num2str(j),' : ']);
		end
	end
end


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


ch=menu(' Choose One Of The Options Below ',' LU Decomposition ',' Determinant ',' CoFactor Form ',' Adjoint Matrix ',' Inverse ');

m=input(' Enter Number Of Rows : ');
n=input(' Enter Number Of Columns : ');

a=zeros(m,n);
l=zeros(m,n);
u=zeros(m,n);

a=get_matrix(m,n);

disp(' The Input Matrix Is : ');
disp(a);

if ch==1
	[l,u]=LUDec(a);
	disp(' The Lower Triangular Matrix Is: ');
	disp(l);
	disp(' The Upper Triangular Matrix Is: ');
	disp(u);
end
if ch==2
	disp(' Determinant Is : ');
	d=Det(a);
	disp(d);
end
if ch==3
	l=CoFactor(a);
	disp(' The CoFactor Matrix Is : ');
	disp(l);
end
if ch==4
	l=Adjoint(a);
	disp(' The Adjoint Matrix Is : ');
	disp(l);
end
if ch==5
	l=Inverse(a);
	disp(' The Inverse Matrix Is : ');
	disp(l);
end