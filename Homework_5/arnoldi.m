function [Q,H,e] = arnoldi(A,fin)

rng(12092019);

[m,k] = size(A);
if m ~= k
    error('Matrix must be square.')
end

Q = zeros(m,fin);
H = zeros(fin+1,fin);

b = rand(m,1);
Q(:,1) = b/norm(b);

for n = 1:fin
    v = A*Q(:,n);
    for j = 1:n
        H(j,n) = Q(:,j)'*v;
        v = v - H(j,n)*Q(:,j);
    end
    H(n+1,n) = norm(v);
    Q(:,n+1) = v/H(n+1,n);
end

H_n = H(1:fin,1:fin);
e = eig(H_n);

end
