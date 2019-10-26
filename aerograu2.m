aero_s = importdata('aerogerador.dat'); %import dos dados do aerogerador
x = aero_s(:,1); %valores para compor o vetor x com os dados da velocidade do vento
y = aero_s(:,2); %valores para compor o vetor y com os dados de potência
n = length(x);
a = ones(n,1);

x2 = [a,x,x.^2];
x2_t = x2.';
x2_x2t = mtimes(x2_t,x2);
inversa2 = inv(x2_x2t);
multi2 = mtimes(x2_t,y);
bchap2 = mtimes(inversa2,multi2);
ychap2 = ((x2)*bchap2);
err2 = (y - ychap2);
SQ2 = sum(err2.^2);
variancia_SQ2 = SQ2/(n - 2);
Syy2 = sum((y - mean(y)).^2);
r22 = 1 - (SQ2/Syy2);
display(r22)

plot (x,y,'r.')
hold on
plot(x,ychap2,'b-')