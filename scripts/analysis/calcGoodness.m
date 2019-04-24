function [goodness nDC nNE XXc Wemb] = calcGoodness( sigma, thresh, beta, Emb, k, Thes, useThes, Wemb )

  sigma
  thresh
  beta
  n = size(Emb,1);
  if length(beta)<3
      beta = [0 1 1];
  end
  if nargin < 8
    if useThes == false
      Wemb = create_W_from_embedding(sigma, thresh, beta, Emb);
    else
      Wemb = create_W_from_embedding(sigma, thresh, beta, Emb, Thes);
    end
  end

  
  I=1:n;
  D = sum(abs(Wemb));
  W = Wemb(D>0, D>0);
  
  nIsol = n - size(W,1);
  size(W)
  k = floor(min(size(W,1), k))

  [~, XXc] = sncut(W,k);
  
  WThes = Thes(D>0,D>0);
  [nDC, nNE] = dc_ne_metric(WThes, XXc);
  
  sum(nDC);
  sum(nNE);
  goodness = (sum(nDC) + sum(nNE) + nIsol)/size(Wemb,1);
end

