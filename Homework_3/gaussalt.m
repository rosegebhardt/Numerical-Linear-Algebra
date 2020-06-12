%% Rose Gebhardt -- Homework 03, Question 4a
function [P,L,U] = gaussalt(A)

% Specify to only use square matices
[m,n] = size(A);
if m ~= n
    error('Matrix must be square.')
end
if det(A) == 0
    error('Matrix must be nonsingular.')
end

% Initial matrices to be updated
U = A;
L = eye(m);
P = eye(m);

% Outer loop: partial pivoting
for k = 1:(m-1)
    % Get index for largest absolute value term on/below diagonal
    [~,i] = max(abs(A(k:m,k)));
    % Fix the index to apply to the whole matrix
    i = i+k-1;
    % Switch rows i and k on/right of the diagonal
    U([k i],k:m) = U([i k],k:m);
    % Switch rows i and k left of the diagonal
    L([k i],1:(k-1)) = L([i k],1:(k-1));
    % Switch rows i and j (all columns)
    P([k i],:) = P([i k],:);
    
    % Inner loop: Gaussian elimination
    % Define entries of L
    L((k+1):m,k) = U((k+1):m,k)/U(k,k);
    % Update U to be upper triangular
    U((k+1):m,k:m) = U((k+1):m,k:m) - L((k+1):m,k)*U(k,k:m);
end

end
