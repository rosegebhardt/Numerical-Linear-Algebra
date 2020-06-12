%% Rose Gebhardt, Yigal Kamel -- 29.1a
function T = tridiag(A)

if ~isequal(A,A')
    error('A must be symmetric!')
end

[m,~] = size(A);

% Algorithm 26.1
for k = 1:m-2
    i = eye(m-k);
    x = A(k+1:m,k);
    v = sign(x(1))*norm(x)*i(:,1)+x;
    v = v/norm(v);
    A(k+1:m,k:m) = A(k+1:m,k:m) - 2*v*(v'*A(k+1:m,k:m));
    A(1:m,k+1:m) = A(1:m,k+1:m) - 2*A(1:m,k+1:m)*(v*v');
end

% Enforce tridiagonality
for i = 1:m
    for j = 1:m
        if i~=j && i~=j+1 && i~=j-1
            A(i,j) = 0;
        end
    end
end

T = A;

end