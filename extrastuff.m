A = imread('background.jpg');

r = 50;

red = A(:,:,1);
green = A(:,:,2);
blue = A(:,:,3);

red = im2double(red);
green = im2double(green);
blue = im2double(blue);

[U_R,S_R,V_R] = svd(red);
[U_G,S_G,V_G] = svd(green);
[U_B,S_B,V_B] = svd(blue);

sum_R = zeros(size(S_R(1,1)*U_R(:,1)*V_R(:,1)'));
for i = 1:1:r
    sum_R = sum_R + S_R(i,i)*U_R(:,i)*V_R(:,i)';
end

sum_G = zeros(size(S_G(1,1)*U_G(:,1)*V_G(:,1)'));
for i = 1:1:r
    sum_G = sum_G + S_G(i,i)*U_G(:,i)*V_G(:,i)';
end

sum_B = zeros(size(S_B(1,1)*U_B(:,1)*V_B(:,1)'));
for i = 1:1:r
    sum_B = sum_B + S_B(i,i)*U_B(:,i)*V_B(:,i)';
end

image(:,:,1) = sum_R;
image(:,:,2) = sum_G;
image(:,:,3) = sum_B;

figure
imshow(image)