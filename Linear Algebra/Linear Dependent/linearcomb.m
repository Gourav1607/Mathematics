m=input('Enter number of vectors:');
n=input('No of components in each vector:');

a=zeros(n,m);
for i=1:m
	disp('Vector 1');
	for j=1:n
		a(j,i)=input(['Enter component',num2str(j),':']);
	end
end
disp(a);
b=zeros(m,1);
for i=1:m
	b(i,1)=input(['Enter coefficient',num2str(i),':']);
end
disp(b);
c=zeros(n,1);

for i=1:m
	c = c + b(i,1)*a(1:n,i);
end
%for i=1:n
%	for j=1:m
%		c(i,1)=c(i,1)+b(j)*a(i,j);
%	end
%end

disp(c);

