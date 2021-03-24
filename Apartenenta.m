function [rez] = Apartenenta(x, val1, val2)
  if x >= 0 && x <= val1
    rez = 0;
  endif
  if x > val2 && x <= 1
    rez = 1;
  endif
  if x >= val1 && x <=val2
    a = 1 / (val2 - val1);
    b = (-val1) / (val2 - val1);
    rez = a * x + b;
  endif
  % am calculat gradul de apartenenta;
  % am pus conditiile de continuitate: limita la stanga 
  % egala cu limita la dreapta egala cu f de val;
  % am pus conditia de continuitate pentru val1 si val2, pentru
  % ca u(x) este continua pe R / { val1, val2};
endfunction