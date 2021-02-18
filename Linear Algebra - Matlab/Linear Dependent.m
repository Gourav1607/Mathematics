function [ mat ] = get_matrix(m,n)
	mat=zeros(m,n);
	for i=1:m
		for j=1:n
			mat(i,j)=input([' Enter Element At ',num2str(i),',',num2str(j),' : ']);
		end
	end
end


m=input('Enter number of vectors:');
n=input('No of components in each vector:');

a=zeros(n,m);
for i=1:m
	disp('Vector 1');
	for j=1:n
		a(i,j)=input(['Enter component',num2str(j),':']);
	end
end

[U,r]=echelonform(a);
if r==n
	disp('Vectors are Linearly independent !!');
else
	disp('Vectors are Linearly dependent !! ');
end