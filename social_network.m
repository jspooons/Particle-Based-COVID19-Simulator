function [adj_matrix] = social_network(n,initial,growth, max_degree)
%SOCIAL_NETWORK Summary of this function goes here
%   Detailed explanation goes here

%n = 30000;
%initial = 25;
%growth = 2;
%max_degree = 500;


N = n;
adj_matrix = zeros(N,N);
nodes = 1:N;
cdf = zeros(N,1);
m0 = initial;
m = growth;
max = max_degree;

r = randperm(N,m0);
nodes = setdiff(nodes, r); 
idx = randperm(length(nodes));
nodes = nodes(idx);

% initialising
for i=1:m0
    tmp = setdiff(r, r(i));
    rand_i = randi([1,m0-1],1,1);
    if adj_matrix(r(i), tmp(rand_i)) ~= 1
        adj_matrix(r(i), tmp(rand_i)) = 1;
        adj_matrix(tmp(rand_i), r(i)) = 1;
    end
end

disp(':')

degrees = sum(adj_matrix);

prev = 0;
for i=1:N
    cdf(i) = degrees(i)/sum(degrees) + prev;
    prev = cdf(i);
end
%f = waitbar(0, 'Starting');
for i=1:N-m0
    disp(i);
    for j=1:m
        rand_p = rand();
        prev = 0;
        for k=1:N
            if (prev < rand_p) && (rand_p <= cdf(k))
                
                adj_matrix(nodes(i), k) = 1;
                adj_matrix(k, nodes(i)) = 1;
                degrees(nodes(i)) = degrees(nodes(i))+1;
                degrees(k) = degrees(k)+1;

                break;
            end
            prev = cdf(k);
        end
    end

    prev = 0;

    total = sum(degrees(degrees>=max));
    
    for k=1:N
        d = 0;
        if degrees(k) < max
            d = degrees(k);
        end
        cdf(k) = d/(sum(degrees)-total) + prev;

        prev = cdf(k);
    end
    %waitbar(i/n, f, sprintf('Progress: %d %%', floor(i/n*100)));
end

plot(graph(adj_matrix));

end