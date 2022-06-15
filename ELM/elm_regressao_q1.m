base = importdata('aerogerador.dat');
X = base(:,1)';
D = base(:,2)';  
sig = 0.1;
p = 1;
q = 4;%quantidade de neurônios
W = sig*randn(q,p+1);
X = [ones(1,2250);X];

%função de ativação
u = W*X;
Z = 1./(1.+exp(-u));
Z = [ones(1,2250);Z];
M = D*Z'*((Z*Z')^(-1));

%teste

X_teste = base(:,1)';
X_teste = [ones(1,2250);X_teste];
Z_teste = W*X_teste;
Z_teste = 1./(1.+exp(-Z_teste));
Z_teste = [ones(1,2250);Z_teste];
D_teste = M*Z_teste;

%análise r2

ychap = D_teste;
y = base(:,2)';
err = (y - ychap);
SQ = sum(err.^2);
Syy = sum((y - mean(y)).^2);
r2 = 1 - (SQ/Syy);
display(r2)

%gráfico
x = base(:,1);
f = base(:,2);
plot (x,f,'r.')
hold on
plot(x,ychap,'b')

