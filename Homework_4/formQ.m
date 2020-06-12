%% Rose Gebhardt, Yigal Kamel - 10.2 (b) %%
function Q = formQ(W)

[m,n] = size(W);
Q = zeros(m,m);
I = eye(m);

for a = 1:m
    
    % Standard normal vectors
    x = I(:,a);
    
    % Algorithm 10.3
    for k = n:-1:1
        x(k:m) = x(k:m) - 2*W(k:m,k)*W(k:m,k)'*x(k:m);
    end
    
    % Build Q from x
    Q(:,a) = x;

end

end
