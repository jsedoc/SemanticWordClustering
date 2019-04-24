function [ thes_aligned ] = align_thesaurus( thes, dic, names )
% Align_thesaurus - this function expects a thesaurus matrix
% the index list of words in the vocabulary, and the names
% cell array which is the new alignment and subset

M = thes;
n = max(size(M,1), size(M,2));
M(n+1,n+1) = 0;
M = triu(M);
M = M + M';

n = length(names);
I=1:length(dic);
mapping=0*(1:n);
rev_mapping = 0*(1:(length(dic)+1));
XX = sparse(n,length(dic)+1);

for i = 1:n
    if sum(ismember(dic, names(i))) > 0
        i
        XX(i,:) = M(I(ismember(dic, names(i))),:);
        mapping(i) = I(ismember(dic, names(i)));
        rev_mapping(I(ismember(dic, names(i)))) = i;
    end
end
XX = sparse(XX);

thes_aligned = sparse(n,n);
for i=1:n
    if mapping(i)>0
        thes_aligned(:,i) = XX(:,mapping(i));
    end
end

end

