function R = Algebraic(nume, d)
  file = fopen(nume,"r");
  output_precision(6);
  c = dlmread(file);
  nr_elem = c(1,1);
  A = zeros(nr_elem);
  Kinv = zeros(nr_elem);

  for i = 2:1:nr_elem+1
    a = c(i,1);
    cnt = c(i,2);
    for j = 3:1:cnt+2
      b = c(i,j);
      if a != b
        A(a,b) = 1;
      endif
    endfor
  endfor
 
  for i = 1:1:nr_elem
    suma = 0;
    for j = 1:1:nr_elem
      suma += A(i,j);
    endfor
    Kinv(i,i) = 1/suma;
  endfor

  fclose(file);
  M = (Kinv * A)';
  unu = ones(nr_elem, 1);
  In = eye(nr_elem);
  R = Inversa(In - d * M) * ((1 - d) / nr_elem) * unu;
endfunction
	
