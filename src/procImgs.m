function procImgs(output_str)
  fnames = dir(fullfile('images', '*.tif'));
  for ind = 1:length(fnames)
    % read here
    I = imread(fullfile('images', fnames(ind).name));

    % do some stuff here

    % write here
    [dir, name, ext, ver] = fileparts(fnames(ind).name);
    name = fullfile('images', strcat([name, '_', output_str, '.tif']));
    imwrite(I, name);
  end
end
