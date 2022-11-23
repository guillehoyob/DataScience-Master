function Ppd = Ppendown(p)
    % Variable Declaration.  
    Ppd = 0; % Return; Add up preasure in time.
    counter = 0; % Counter to obtain the total preasure mean.

    % Iterate over each value of the vector p.
    % Each time p != 0 Ppd Sums up with the current preasure; staking value
    for i = p
        if i ~= 0
            Ppd = Ppd + i;
            counter = counter +1;
        end
    end
    
    % End operation to extract the Average Preasure when signal is
    % different to 0.
    Ppd = Ppd/counter;
end