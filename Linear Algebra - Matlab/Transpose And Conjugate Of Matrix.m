function [ mat ] = get_matrix(m,n)
	mat=zeros(m,n);
	for i=1:m
		for j=1:n
			mat(i,j)=input([' Enter Element At ',num2str(i),',',num2str(j),' : ']);
		end
	end

end


ch=menu(' First Program - Transpose And Conjugate Transpose Of Matrix', ' Transpose',' Conjugate Transpose');

m=input(' Enter Number Of Rows : ');
n=input(' Enter Number Of Columns : ');

a=get_matrix(m,n);	# matrix input
b=zeros(m,n);		# transpose
for i=1:m
 	for j=1:n
 	      	b(i,j)=a(j,i);
	end
end

c=conj(b);		# conjugate transpose

if(ch==1)
	printf(' Transpose Is :\n');
	disp(b);
end
if(ch==2)
	printf(' Conjugate Transpose Is :\n');
	disp(c);
end
