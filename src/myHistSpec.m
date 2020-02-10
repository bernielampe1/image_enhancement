function J = myHistSpec(I, mean, sigma)
  % histogram equalize the first image
  J = im2uint8(histeq(im2double(I), 256));

  % use gaussian distribution
  S = normpdf([0:256], mean, sigma);
  Scdf = 256 * cumsum(S);

  % compute the inverse transform
  for i = 1:256
    diff = abs((i-1) - Scdf(1));
    min = 0;
    for j = 1:256
      if abs((i-1) - Scdf(j)) < diff
        diff = abs((i-1) - Scdf(j));
        min = j-1;
      end
    end

    Sinv(i) = round(min);
  end

  % compute final image
  [rows, cols] = size(J);
  for r = 1:rows
    for c = 1:cols
      J(r,c) = Sinv(J(r, c)+1);
    end
  end

end

