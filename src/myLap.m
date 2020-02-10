function J = myLap(I, thresh)
  F = fspecial('laplacian');
  J = conv2(I, F, "same");
  J(J <= thresh) = 0;
  J = simple_thinning(J);
end

function bw = simple_thinning(strength)
  [r c] = size(strength);
  x = ( strength > [ zeros(r,1) strength(:,1:end-1) ] & ...
        strength > [ strength(:,2:end) zeros(r,1) ] );
  y = ( strength > [ zeros(1,c); strength(1:end-1,:) ] & ...
        strength > [ strength(2:end,:); zeros(1,c) ] );
  bw = x | y;
endfunction

