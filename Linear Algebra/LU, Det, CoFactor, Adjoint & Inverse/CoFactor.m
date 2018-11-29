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
