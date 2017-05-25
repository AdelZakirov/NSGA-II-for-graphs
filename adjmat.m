function A=adjmat(origin,destin)
n=max(max(origin),max(destin));
A=sparse(origin,destin,1,n,n);
