function invs=Inversa(A)
	[n n]=size(A);
  inversa = zeros(n);
  In = eye(n);
	Q = A;
	R = zeros(n);
	for k = 1 : n
           R( k, k ) = norm( Q( 1 : n, k ) );
	   Q( 1 : n, k ) = Q( 1 : n, k ) / R( k, k );
	   for j = k + 1 : n
		R( k, j ) = Q( 1 : n, k )' * Q( 1 : n, j );
		Q( 1 : n, j ) = Q(1 : n, j ) - Q( 1 : n, k ) * R( k, j );
	   endfor
	endfor
  % am aplicat algoritmul Gram-Schmidt modificat.
  for i = 1:1:n
    inversa(:,i) = SST(R, (Q' * In)(:,i));
  endfor
  % cum A * A^(-1) = In; => Q * R * A^(-1) = In => R * A^(-1) = Qt * In
  % apoi am aplicat SST pe coloane, adica R * A(:,i) = (Qt * In)(:,i) si 
  % am aflat de aici A(:,i), unde i este numarul coloanei;
  invs = inversa;
endfunction
