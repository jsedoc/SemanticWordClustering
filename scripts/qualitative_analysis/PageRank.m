function [ p ] = PageRank( L, d )
% from http://people.revoledu.com/kardi/tutorial/PageRank/Page-Rank-Matlab-Code.html
%  
% (c) 2012 Kardi Teknomo
if nargin < 1
    L = triu(ones(6),0)
end
if nargin < 2
    d = 0.85;
end

[m,n] = size(L);
c = sum(L);
L_c = L./repmat(c,m,1);
k=0;

while 1
    k = k + 1;
    for i = 1:m
        p(i) = (1-d) + d*(L_c(i,:)*c');
    end
    c = p;
    if sum(sum(p)) == m || k>256
        break;
    end
end
end

