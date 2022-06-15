aero_s = importdata('aerogerador.dat'); %import dos dados do aerogerador
x = aero_s(:,1); %valores para compor o vetor x com os dados da velocidade do vento
y = aero_s(:,2); %valores para compor o vetor y com os dados de potência
n = length(x);
a = ones(n,1);

x3 = [a,x,x.^2,x.^3];
x3_t = x3.';
x3_x3t = mtimes(x3_t,x3);
inversa3 = inv(x3_x3t);
multi3 = mtimes(x3_t,y);
bchap3 = mtimes(inversa3,multi3);
ychap3 = (x3*bchap3);
err3 = (y - ychap3);
SQ3 = sum(err3.^2);
variancia_SQ3 = SQ3/(n - 2);
Syy3 = sum((y - mean(y)).^2);
r23 = 1 - (SQ3/Syy3);
display(r23)

plot (x,y,'r.')
hold on
plot(x,ychap3,'b-')