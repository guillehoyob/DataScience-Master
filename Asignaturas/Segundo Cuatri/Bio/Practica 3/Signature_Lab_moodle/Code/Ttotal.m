function T = Ttotal(x)
    % Variable Declaration.  
    frec = 200;
    n = size(x,2); % Size of the vectors structure.

    % Mathematical operation to get the end time.
    T = n/frec;
    %disp(T);
end