function Npu = Npenups(p) 
    % Variable Declaration.  
    flag = 0; % When a 0 is detected; flag = 1; This way we can count a string of 0's only once.
    aux = 0; % Return counter of the times the pen has been lifted from the paper.

    % Follow p vector from pos 0 to end, each thime the first 0 is detected
    % Npu = Npu +1; flag = 1;. 
    % Each time flag = 1 && vector[i] != 0: flag = 0;
    for i = p
       if (i == 0 && flag == 0)
           aux = aux +1;
           flag = 1;
       elseif  (i ~= 0 && flag == 1)
           flag = 0;
       end
    end

    Npu = aux;
end