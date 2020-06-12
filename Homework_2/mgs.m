%% Rose Gebhardt - 8.2 %%
function [Q,R] = mgs(A)

[m,n] = size(A);

V = zeros(m,n);
Q = zeros(m,n);
R = zeros(n,n);

for i = 1:n
    V(:,i) = A(:,i);
end

for i = 1:n
    R(i,i) = norm(V(:,i));
    Q(:,i) = V(:,i)/R(i,i);
    
    for j = (i+1):n
        R(i,j) = Q(:,i)'*V(:,j);
        V(:,j) = V(:,j) - R(i,j)*Q(:,i);
    end
end

end
