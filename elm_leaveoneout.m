base = importdata('iris_log.dat');
%base de dados
X = base(:,1:4)'; 
D = base(:,5:7)'; 

sig = 0.1;
p = 4;
q = 2;%quantidade de neurônios
W = sig*randn(q,p+1);
X = [ones(1,150);X];

%função de ativação
u = W*X;
Z = 1./(1.+exp(-u));
Z = [ones(1,150);Z];
M = D*Z'*((Z*Z')^(-1));


cont=0; %Conta a quantidade de acertos
for i=1:1:150
    Xt = base(i,1:4)'; %Amostras
    Xt = [ones(1,1);Xt];
    Zt = W*Xt;
    Zt = 1./(1.+exp(-Zt));
    Zt = [ones(1,1);Zt];
    Dt = M*Zt;
    
    matriz_aux = base(i,5:7)';
    [a b] = max(matriz_aux(:,1));
    [c d] = max(Dt(:,1));
    if b==d
        cont = cont+1;
    end
end
acertos = cont/150



