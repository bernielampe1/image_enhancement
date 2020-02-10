function J = myHistEq(I)
  % run image equalization
  J = im2uint8(histeq(im2double(I), 256));
end
