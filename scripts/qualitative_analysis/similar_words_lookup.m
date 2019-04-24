function [ synset, z,syntable ] = similar_words_lookup( word, dic, thes, k, thresh )
% this is a function to find similar words to our word of interest.
% Example usage from word embeddings
%  k - is sigma, so  exp((-z(I).^2)/k)'
%   - [ synset, z,syntable ] = thes_synonym_lookup('help', names, WD, 10, 0.01);
%   Or for simple nearest neighbors
%   - [ synset, z,syntable ] = thes_synonym_lookup('help', names, WD, 10);
% Example usage for a thesaurus 
%   - [ synset ] = thes_synonym_lookup('help', names, thesaurus_aligned);

ind = find(ismember(dic,word));
  if nargin<4
    J = 1:length(dic);
    I = J(thes(ind,:)>0);
    if length(I) > 0
        tmp = [I; PersonalizedPageRank(ind, thes)]';
        tmp = sortrows(tmp,-2);
        synset = dic(tmp(:,1));
        syntable = table(tmp(:,2),'VariableNames',{'PPR_score'},'RowNames',synset');
        z = tmp(:,2);
    else
        synset = {''};
    end
  else
    %for i=1:size(dic,1)
    %  z(i) = norm(thes(ind,:)- thes(i,:));
    %end
    z = pdist2(thes(ind,:),thes);
    if nargin < 5
        [~,I] = sort(z);
        synset = dic(I(2:k+1));
    else
        tmp = [1:length(dic); exp((-z.^2)/k)]';
        tmp = sortrows(tmp, -2);
        I = tmp(tmp(:,2)>thresh,1);
        score = exp((-z(I).^2)/k)';
        synset = dic(I(2:end));
        syntable = table(score(2:end),'VariableNames',{'RBF_score'},'RowNames',synset');

    end
  end
  synset = [{word}; {'________________'}; synset];
end