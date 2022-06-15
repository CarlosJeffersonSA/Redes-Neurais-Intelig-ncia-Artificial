base = importdata('iris_log.dat');
%método hold-out
X = base([1:21,31:51,61:81,91:111,121:141],1:4)';
D = base([1:21,31:51,61:81,91:111,121:141],5:7)';

sig = 0.1;
p = 4;
q = 1;
W = sig*randn(q,p+1);%pesos aleatórios
X = [ones(1,105);X];
%função de ativação
u = W*X;
Z = 1./(1.+exp(-u));
Z = [ones(1,105);Z];
M = D*Z'*((Z*Z')^(-1));

%teste

X_teste = base([22:30,52:60,82:90,112:120,142:150],1:4)';
X_teste = [ones(1,45);X_teste];
Z_teste = W*X_teste;
Z_teste = 1./(1.+exp(-Z_teste));
Z_teste = [ones(1,45);Z_teste];
D_teste = M*Z_teste;

%acurácia

cont=0;
for i=1:45
    [a b] = max(D(:,i));
    [c d] = max(D_teste(:,i));
    if b==d
        cont = cont+1;
    end
end

acc = cont/45

