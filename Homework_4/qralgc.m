%% Rose Gebhardt, Yigal Kamel -- 29.1 (c)
function [T_new,off_diag] = qralgc(T)

[m,~] = size(T);
off_diag = [];

while abs(T(m,m-1)) > 10^-12
    [W,R] = house(T);
    Q = formQ(W);
    T = R*Q;
    off_diag = abs([off_diag T(m,m-1)]);
end

T_new = T;

end