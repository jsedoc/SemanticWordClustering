function [ p ] = PersonalizedPageRank( idx, W, d )
% PERSONALIZEDPAGERANK - algorithm to get the personalized
% page rank for page idx
%
% INPUT idx is the page index, W is the adjacency matrix

W = triu(W(W(idx,:)> 0, W(idx,:)> 0));
W = eye(size(W)) + W;

if nargin < 3
    p = PageRank(W);
else
    p = PageRank(W, d);
end
end

