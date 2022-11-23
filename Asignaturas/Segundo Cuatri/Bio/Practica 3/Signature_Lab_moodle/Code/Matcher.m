function Score = Matcher(test,Model)
Score = pdist2(test, Model, 'euclidean');
Score = mean(Score);
end