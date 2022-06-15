aero_s = importdata('aerogerador.dat'); %import dos dados do aerogerador
x = aero_s(:,1); %valores para compor o vetor x com os dados da velocidade do vento
y = aero_s(:,2); %valores para compor o vetor y com os dados de potência
n = length(x);
a = ones(n,1);

x5 = [a,x,x.^2,x.^3,x.^4,x.^5];
x5_t = x5.';
x5_x5t = mtimes(x5_t,x5);
inversa5 = inv(x5_x5t);
multi5 = mtimes(x5_t,y);
bchap5 = mtimes(inversa5,multi5);
ychap5 = (x5*bchap5);
err5 = (y - ychap5);
SQ5 = sum(err5.^2);
variancia_SQ5 = SQ5/(n - 2);
Syy5 = sum((y - mean(y)).^2);
r25 = 1 - (SQ5/Syy5);
display(r25)

plot (x,y,'r.')
hold on
plot(x,ychap5,'b-')