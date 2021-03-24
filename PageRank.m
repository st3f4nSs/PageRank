function [R1 R2] = PageRank(nume, d, eps)
  file = fopen(nume,"r");
  nr_elem = fscanf(file,"%f",1);

  for i = 1:1:nr_elem+1
    linie = fgetl (file);
  endfor
  val1 = fscanf(file,"%f",1);
  val2 = fscanf(file,"%f",1);
  fclose(file);

  fisier_iesire = strcat(nume,".out");
  file = fopen(fisier_iesire, "w");
  fprintf(file, "%i\n", nr_elem);
  fprintf(file, "\n");
  R1 = Iterative(nume, d, eps);
  fprintf(file, "%.6f\n", R1);
  fprintf(file, "\n");
  R2 = Algebraic(nume, d);
  fprintf(file, "%.6f\n", R2);
  fprintf(file, "\n");

  for i = 1:1:nr_elem
    rez(i,1) = Apartenenta(R2(i), val1, val2);
  endfor
  [v indici] = sort(rez);
  for i = 1:1:nr_elem
    fprintf(file, "%i ",i);
    fprintf(file, "%i ",indici(nr_elem - i + 1));
    fprintf(file, "%.6f\n",v(nr_elem - i + 1));
  endfor

  fclose(file);
endfunction
