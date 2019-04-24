function [ nDC nNE ] = dc_ne_metric( W, XXc )
%dc_ne_metric is a small function to compute the total number
% of negative edges and disconnected components.

nc = size(XXc,2);
nDC = zeros(nc,1);
nNE = zeros(nc,1);
for i=1:nc
    Ws = W(XXc(:,i)>0, XXc(:,i)>0);
    nNE(i) =  sum(sum(Ws<0))/2;
    D = sum(Ws);
    nIsoNodes = sum(D<1);
    Wsp = Ws(D>0,D>0);

    cc = graph_connected_components(Wsp);
    if(length(cc)>0)
        nDC(i) = max(cc) - 1 + nIsoNodes;
    else
        nDC(i) = nIsoNodes;
    end
end

