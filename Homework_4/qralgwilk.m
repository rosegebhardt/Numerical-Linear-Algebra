%% Rose Gebhardt, Yigal Kamel -- 29.1 (d)
function [T_new,off_diag] = qralgwilk(T)

[m,~] = size(T);
off_diag = [];

while abs(T(m,m-1)) > 10^-12
    % Wilkinson Shift
    B = T(m-1:m,m-1:m);
    delta = (B(1,1)-B(2,2))/2;
    if delta == 0 
        mu = B(2,2) - ((B(2,1)^2)/(abs(delta)+sqrt(delta^2 + B(2,1)^2)));
    end
    if delta ~= 0
        mu = B(2,2) - ((sign(delta)*B(2,1)^2)/(abs(delta)+sqrt(delta^2 + B(2,1)^2)));
    end
    
    % QR with shifts
    C = T-mu*eye(m);
    [W,R] = house(C);
    Q = formQ(W);
    T = R*Q + (mu*eye(m));
    
    % Store off-diagonal entries
    off_diag = abs([off_diag T(m,m-1)]);
end

T_new = T;

end