close all
clear all
clc

%%%%%%%%%
% First visualize some example images

imagen=imread('./FaceDatabaseATT/s06/1.pgm');
figure;imshow(imagen);


%Divide the number of images per user for Train and Test:
Train=7;
Test=4;

% we add paths to facilitate the code
addpath(cd)
addpath('DetPlots')
cd FaceDatabaseATT

coeff=5; %Number of DCT coefficients to use

dirListA=dir;
dirList=dirListA(4:43);

%Initialize the Feature and Label Matrix
MatrixTrainFeats=zeros(Train*40,coeff*coeff-1); %each row contains the features of one face image
MatrixTrainLabels=zeros(Train*40,1); %each row contains the ID of the user
contR=1;

MatrixTestFeats=zeros(Test*40,coeff*coeff-1);
MatrixTestLabels=zeros(Test*40,1);
contT=1;

for i=1:numel(dirList) %Loop for each user
   
    cd(dirList(i).name);
    
    images=dir('*.pgm');
    
    %%% Feature extraction for Training Dataset
    
    for j=1:Train %Train images
        im=imread(images(j).name);
        im=double(im);
        %figure;imshow(im);
        
        %%Feat Extraction
        
        % extract the features from each image
        feats=feature_extraction(im,coeff);
        MatrixTrainFeats(contR,:)=feats;
        MatrixTrainLabels(contR,1)=i; %user i
        contR=contR+1;
        
    end
    
      %%% Feature extraction for Test Dataset
    
    for j=(Train+1):10
       im=imread(images(j).name);
       im=double(im);
        %figure;imshow(im);
        
        %%Feat Extraction
        
        % extract the features from each image
        feats=feature_extraction(im,coeff);
        MatrixTestFeats(contT,:)=feats;
        MatrixTestLabels(contT,1)=i;
        contT=contT+1;
    end
    
    cd ..
    
end

%Similarity Computation Stage

% Each test image is going to be compared to each of the training images
% for each of the 40 users (N comparisons). Then, the final score is the
% result of the min of the N comparisons of each test image with the N
% training images of each user, which can be a genuine comparison (target)
% or an impostor comparison (NonTarget)

TargetScores=[];
NonTargetScores=[];

for i=1:numel(MatrixTestLabels) %For each Test image
    contTest=1;
    for j=1:numel(MatrixTrainLabels) %Comparison with each Training image
            
        my_distance(contTest)=mean(abs(MatrixTestFeats(i,:)-MatrixTrainFeats(j,:))); %Compute the distance measure
        
        if(MatrixTestLabels(i,:)==MatrixTrainLabels(j,:)) %if it's a genuine comparison
            LabelTest(contTest)=1;
            
        else % otherwise
            LabelTest(contTest)=0;
        end
        contTest=contTest+1;
        
    end
    
    %The final score is the min of the 6 comparisons of each Test image against the training images of each user
    contF=1;
    for k=1:Train:numel(my_distance)
        my_distanceRed(contF)=min(my_distance(k:k+Train-1)); %Extract the scores of the N training signatures and select the min
        
        if LabelTest(k)==1 %target score            
            TargetScores=[TargetScores, my_distanceRed(contF)];
        else %non target score 
            NonTargetScores=[NonTargetScores, my_distanceRed(contF)];
        end
        
        
        contF=contF+1;
    end
    
    
    
    
end

%Multiply by -1 to have higher values for genuine comparisons, as we have a distance computation. With other type of classifier this wouldn't be necessary.

TargetScores=-TargetScores;
NonTargetScores=-NonTargetScores;

cd ..

save('ParametrizaATT','TargetScores','NonTargetScores');

[EER]=Eval_Det(TargetScores,NonTargetScores,'b') %Plot Det curve



