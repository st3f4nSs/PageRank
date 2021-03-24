function R = Iterative(nume, d, eps)
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

  for i = 1:1:nr_elem
    PR1(i, 1) = 1 / nr_elem;
  endfor
 
  PR2 = d * M * PR1 + ((1 - d) / nr_elem) * unu;

  while norm(PR2 - PR1) >= eps
    PR1 = PR2;
    PR2 = d * M * PR1 + ((1 - d) / nr_elem) * unu;
  endwhile

  R = PR1;
endfunction
