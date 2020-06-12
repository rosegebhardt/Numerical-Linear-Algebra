A = imread('peppers.png');
A = A(:,:,1);
A = im2double(A);
[U,S,V] = svd(A);
sum = zeros(size(S(1,1)*U(:,1)*V(:,1)'));
for i = 1:1:20
    sum = sum + S(i,i)*U(:,i)*V(:,i)';
end
figure
imshow(sum)

size(A)