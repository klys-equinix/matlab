function [X] = czebyszew(num_nodes)
    X = zeros(1, num_nodes);
    for i=1:num_nodes
        X(i) = cos(((2 * i + 1) * pi) / (2 * num_nodes + 2));
    end
    X;
end