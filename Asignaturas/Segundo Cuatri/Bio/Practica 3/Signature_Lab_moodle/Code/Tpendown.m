function Tpd = Tpendown(p) 
    % Variable Declaration
    aux = 0;

    % Total Time
    frec = 200;
    n = size(p,2); % Size of the vectors structure.
    % Mathematical operation to get the total end time.
    T = n/frec;

    % Iterate over each value of the vector p.
    % Each time p != 0 Tdp sums up 1. - Register each second the pen is down.
    for i = p
        if i ~= 0
            aux = aux + 1;
        end
    end
    Tpd = aux/T;
end