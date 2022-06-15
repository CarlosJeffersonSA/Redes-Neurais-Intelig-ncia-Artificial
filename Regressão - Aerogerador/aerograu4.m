aero_s = importdata('aerogerador.dat'); %import dos dados do aerogerador
x = aero_s(:,1); %valores para compor o vetor x com os dados da velocidade do vento
y = aero_s(:,2); %valores para compor o vetor y com os dados de potência
n = length(x);
a = ones(n,1);

x4 = [a,x,x.^2,x.^3,x.^4];
x4_t = x4.';
x4_x4t = mtimes(x4_t,x4);
inversa4 = inv(x4_x4t);
multi4 = mtimes(x4_t,y);
bchap4 = mtimes(inversa4,multi4);
ychap4 = (x4*bchap4);
err4 = (y - ychap4);
SQ4 = sum(err4.^2);
variancia_SQ4 = SQ4/(n - 2);
Syy4 = sum((y - mean(y)).^2);
r24 = 1 - (SQ4/Syy4);
display(r24)

plot (x,y,'r.')
hold on
plot(x,ychap4,'b-')