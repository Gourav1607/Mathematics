function [ mat ] = get_matrix(m,n)

mat=zeros(m,n); 
for i=1:m
	for j=1:n
		mat(i,j)=input([' Enter Element At ',num2str(i),',',num2str(j),' : ']);
	end
end
 
end
