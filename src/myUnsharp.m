function J = myUnsharp(I, k)
  J = imsmooth(I, 'Average'); % estimate background (spatial, low-pass filter)
  J = I - J; % subtract the background leaving the high frequency details
  J = I + k .* J; % add the details back in to emphasize

  % when k > 1, then we call this high-boost filtering
end

