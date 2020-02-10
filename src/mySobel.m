function L = mySobel(I, thresh)
  F1 = fspecial("sobel");
  F2 = F1';
  J = conv2(I, F1, "same");
  K = conv2(I, F2, "same");
  L = sqrt(J.^2 + K.^2);
  L(L <= thresh) = 0;
  L = simple_thinning(L);
end

function bw = simple_thinning(strength)
  [r c] = size(strength);
  x = ( strength > [ zeros(r,1) strength(:,1:end-1) ] & ...
        strength > [ strength(:,2:end) zeros(r,1) ] );
  y = ( strength > [ zeros(1,c); strength(1:end-1,:) ] & ...
        strength > [ strength(2:end,:); zeros(1,c) ] );
  bw = x | y;
endfunction

