aero_s = importdata('aerogerador.dat'); %import dos dados do aerogerador
x = aero_s(:,1);%valores para compor o vetor x com os dados da velocidade do vento
y = aero_s(:,2);%valores para compor o vetor y com os dados de potência
n = length(x);%variável com o tamanho de x
a = ones(n,1);%matriz coluna de uns

%Regressão de grau 1
x1 = [a,x];%matriz com as entradas x do aerogerador
x1_t = x1.';%matriz transposta de x1
x1_x1t = mtimes(x1_t,x1);%produto das matrizes transposta e de entradas
inversa = inv(x1_x1t);%matriz inversa (XtX)^-1
multi1 = mtimes(x1_t,y);%produto de (XtX)^-1 e y
bchap = mtimes(inversa,multi1);
ychap = (x1*bchap);%cálculo do y^
err = (y - ychap);%cálculo do erro
SQ = sum(err.^2);%soma dos quadrados dos resíduos
variancia_SQ = SQ/(n - 2);%variância de SQ
Syy = sum((y - mean(y)).^2);%soma dos quadrados das diferenças entre valores de y e a média(ybarra)
r21 = 1 - (SQ/Syy);%coeficiente de determinação
display(r21)

plot (x,y,'r.')
hold on
plot(x,ychap,'b-')