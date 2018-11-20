data = load('data2017.mat');
data = data.data;

total_length = 0;
m = length(data.shoe);

array = {'shoe', 'drinking', 'brushing', 'writing'};
for i=1:4
    total_length = total_length + length(getfield(data, array{i}));
end

labels = zeros(1,total_length);
labels(1:m) = 1;

pre_process = [];

for j=1:4
    
    n = length(getfield(data, array{j}));
    
    for i=1:n
        
        process = zeros(1,7);
        
        %Gravity
        process(1) = mean(getfield(data, array{j}, 'x'));
        process(2) = mean(getfield(data, array{j},  'y'));
        process(3) = mean(getfield(data, array{j}, 'z'));

        %Time domain
        r = sqrt( (getfield(data, array{j}, 'x')).^2 + (getfield(data, array{j}, 'y')).^2 + (getfield(data, array{j}, 'z')).^2);
        r = r - mean(r, 1);

        %Standard deviation
        process(4) = std(r);
        process(5) = skewness(r);

        %Frequency
        [F25, F75] = energy25_75(r, 128);
        process(6) = F25;
        process(7) = F75;
        
        pre_process = [pre_process; process];
    end
end

length(pre_process)



