base = importdata('aerogerador.dat');
X = base(:,1)';
D = base(:,2)';
sig = 0.1;
p = 1;
q = 2;
W = sig*randn(q,p+1);
X = [ones(1,2250);X];

u = W*X;
Z = 1./(1.+exp(-u));
Z = [ones(1,2250);Z];
M = D*Z'*((Z*Z')^(-1));

%teste

X_teste = base(23,1);
X_teste = [1;X_teste];
Z_teste = W*X_teste;
Z_teste = 1./(1.+exp(-Z_teste));
Z_teste = [1;Z_teste];
D_teste = M*Z_teste