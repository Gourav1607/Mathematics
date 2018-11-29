function [R,C,N,L] = basis(A,b)
    [m,n]=size(A);
    [L1,U,r,p] = echelonform3(A,b);
    R=U(1:r,1:n);
    R=R';

    for(i=1:r)
        C(1:m,i) = A(1:m,p(i));
    end

    j=1;
    for(i=r+1:m)
        L(j++,1:m)=L1(i,1:m);
    end

    if(r==m)
        disp('Left Null Space is only zero vector');
        L=0;
    else
        L=L';
    end

    t=1;
    b=zeros(m,1);

    for(i=1:n)
        flag=0;
        for(j=1:r)
            if(i==p(j))
                flag=1;
		        break;
            end
        end
        if(flag==1)
            continue;
        else
            X=zeros(n,1);
            X(i,1)=1;
            X=backsubstitute(U,p,b,X);
            N(1:n,t++)=X;
        end
    end
end
