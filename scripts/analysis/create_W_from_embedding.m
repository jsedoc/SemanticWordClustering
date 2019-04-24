function [ W, avg_dist ] = create_W_from_embedding( sigma, thresh, beta, Emb, Thes )
% create_W_from_embedding takes 3 parameters and an embedding and possibly
%  a thesaurus and then returns an edge wieght matrix
%  similarity is using the heat kernel


 n = size(Emb,1);
 W = zeros(n);
 for i=1:n
   Temp    = sqrt(sum(bsxfun(@minus,Emb(i,:),Emb((i+1):n,:)).^2, 2));
   W(i,i+1:n)  = (exp(-(Temp.*Temp)./sigma))';
 end
  % apply thresholding
  W(W<thresh)=0;
  
  W = sparse(W);
  
  W = W + W';

  
  % if a Thesaurus is added incorporate the thesaurus
  if nargin > 4
    W = W .* (beta(1) * ones(size(Thes)) + beta(2)*(Thes>0) - beta(3)*(Thes<0));
  end
end

