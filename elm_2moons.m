base = importdata('twomoons.dat');
%==========================
%   |ALGORITMO ELM - 2 moons|
%==========================
X = base(:,1:2)';
D = base(:,3)';
sig = 0.1;
p = 2;
q = 11;%qtd de neurônios
W = sig*randn(q,p+1);%pesos aleatórios
%normalização dos dados
for i = 1:2
    X(i,:) = (X(i,:)-mean(X(i,:)))/std(X(i,:));
end

X = [(-1)*ones(1,1001);X];%bias
%função de ativação
u = W*X;
Z = 1./(1.+exp(-u));
Z = [(-1)*ones(1,1001);Z];
M = D*Z'*((Z*Z')^(-1));

%teste
X_teste = zeros(3,1);%matriz de zeros
z = zeros(3,1);%matriz de zeros

%laço para criação de superfície de decisão e teste com a base de dados utilizando o
%ELM
for  i = -2 : 0.05 : 2
    for j = -2.5 : 0.05: 2.5
        %teste
        X_teste = [-1;j;i];
        Z_teste = W*X_teste;
        z = 1./(1.+exp(-Z_teste));
        z = [-1;z];
        D_teste = M*z;
        %plotar superfície de decisão das "luas"
        if (D_teste >= -0.1) && (D_teste <= 0.1)
            scatter(X_teste(2), X_teste(3), 5, 'd','r')
            hold on 
        end
    end
end


scatter(X(2,:), X(3,:),7, D>0, 'filled');
grid on    