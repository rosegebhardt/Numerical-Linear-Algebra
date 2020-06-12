%% Rose Gebhardt, Yigal Kamel -- 29.1 (b)
function T_new = qralg(T)

[m,~] = size(T);

% Algorithm 28.1 "Pure" QR Algorithm
while abs(T(m,m-1)) > 10^-12
    [W,R] = house(T);
    Q = formQ(W);
    T = R*Q;
end

T_new = T;

end