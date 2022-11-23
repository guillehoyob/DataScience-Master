close all
clear all
clc

% Variable Definition
gen = [1,2,6,7];

%BiosecurIDparameters matrix with: 50 (users) x 16 (signatures/user) x 4 (params)
BiosecurIDparameters=ones(50,16,4);

%YOUR CODE
for user = 1:50
    counter = 1;
    for sesion = 1:4
        for sign_genuine = gen
            %You could use this inside your code
            %This is how to load the signatures:  
            if user < 10
                BiosecurID=load(['./DB/u100', num2str(user),'s000', num2str(sesion), '_sg000', num2str(sign_genuine), '.mat']);
            else
                BiosecurID=load(['./DB/u10', num2str(user),'s000', num2str(sesion), '_sg000', num2str(sign_genuine), '.mat']);
            end
            
            x=BiosecurID.x;
            y=BiosecurID.y;
            p=BiosecurID.p;
            
            % Extraction of features.
            BiosecurIDparameters(user,counter,:) = featureExtractor(x,y,p);
            counter = counter + 1;
            %disp(BiosecurIDparameters)
        end
    end
end

%disp(BiosecurIDparameters(1,1,1));
%disp(BiosecurIDparameters(1,1,2));
%disp(BiosecurIDparameters(1,1,3));
%disp(BiosecurIDparameters(1,1,4));

% Now with all the data we generate a histogram.
% Normalize distributions between 0 and 1
figure;
histogram(BiosecurIDparameters(:,:,1),'Normalization', 'probability');

figure;
histogram(BiosecurIDparameters(:,:,2),'Normalization', 'probability');

figure;
histogram(BiosecurIDparameters(:,:,3),'Normalization', 'probability');

figure;
histogram(BiosecurIDparameters(:,:,4),'Normalization', 'probability');

save('BiosecurIDparameters','BiosecurIDparameters');
