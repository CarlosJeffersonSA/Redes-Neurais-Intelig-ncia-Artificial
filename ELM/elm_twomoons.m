base = importdata('twomoons.dat');

X = base(:,1:2)';
D = base(:,3)';
d1 = base(:,3);
x1 = base(:,1);
x2 = base(:,2);
sig = 0.1;
p = 2;
q = 5;
W = sig*randn(q,p+1);%pesos aleatórios
X = [ones(1,1001);X];
%função de ativação
u = W*X;
Z = 1./(1.+exp(-u));
Z = [ones(1,1001);Z];
M = D*Z'*((Z*Z')^(-1));

%teste

X_teste = base(:,1:2)';
X_teste = [ones(1,1001);X_teste];
Z_teste = W*X_teste;
Z_teste = 1./(1.+exp(-Z_teste));
Z_teste = [ones(1,1001);Z_teste];
D_teste = M*Z_teste;

%acurácia

cont=0;
for i=1:1001
    [a b] = max(D(:,i));
    [c d] = max(D_teste(:,i));
    if b==d
        cont = cont+1;
    end
end

acc = cont/1001;

gscatter(x1,D_teste,d1,'kb')