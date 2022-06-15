aero_s = importdata('aerogerador.dat'); %import dos dados do aerogerador
x = aero_s(:,1); %valores para compor o vetor x com os dados da velocidade do vento
y = aero_s(:,2); %valores para compor o vetor y com os dados de pot�ncia
n = length(x);%conjunto de pontos n com o mesmo tamanho que x
 
%Calculando betas
beta_1 = ((sum(y.*x)) - ((1/n)*(sum(y)))*(sum(x)))/((sum(x.^2))-(1/n)*(sum(x))^2);
beta_0 = ((mean(y)) - (beta_1*(mean(x)))); 
plot(x,y,'.');
hold on
yChap = zeros(n,1,1); %inicializando o yChapeu
 
%Fazendo o c�lculo de yChapeu, para cada valor de x
for i = 1 : n
yChap(i) = beta_0 + beta_1*x(i);
end
%procedimento para c�lculo da vari�ncia do ru�do
err = y - yChap;%Erro de res�duos
SQ = sum(err.^2);%Soma dos quadrados dos res�duos
variancia_SQ = SQ/(n - 2);%Variancia de SQ 
Syy = sum((y - mean(y)).^2);%Retirado do slide disponibilizado pelo professor(F�rmula R2).
 
R2 = 1 - SQ/Syy; % C�lculo do R2
display(R2)
display(beta_0)
display(beta_1)
plot(x, yChap) % Plotando a reta de regress�o sobre o gr�fico anterior
hold off