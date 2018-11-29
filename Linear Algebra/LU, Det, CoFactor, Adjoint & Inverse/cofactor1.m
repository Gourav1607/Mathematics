function [B]=cofactor1(a,i,j);

    [m,n]=size(a);
    B=a([1:i-1,i+1:m],[1:j-1,j+1:n]);

end
