%% Rose Gebhardt - 10.2 (a)%%
function [W,R] = house(A)

[m,n] = size(A);

%build l.t. matrix from A
for k = 1:1:n
    x = A(k:m,k);
    I = eye(m-k+1);
    v = sign(x(1))*norm(x)*I(:,1) + x;
    v = v/norm(v);
    A(k:m,k:n) = A(k:m,k:n) - 2*v*v'*A(k:m,k:n);
    W(k:m,k) = v;
end

% R is the first n rows of each column
R = A(1:n,:);

end