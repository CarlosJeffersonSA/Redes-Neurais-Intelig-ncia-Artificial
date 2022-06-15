aero_s = importdata('aerogerador.dat'); %import dos dados do aerogerador
x = aero_s(:,1); %valores para compor o vetor x com os dados da velocidade do vento
y = aero_s(:,2); %valores para compor o vetor y com os dados de potência
n = length(x);
a = ones(n,1);

%Regressão de grau 1
x1 = [a,x];
x1_t = x1.';
x1_x1t = mtimes(x1_t,x1);
inversa = inv(x1_x1t);
multi1 = mtimes(x1_t,y);
bchap = mtimes(inversa,multi1);
ychap = (x1*bchap);
err = (y - ychap);
SQ = sum(err.^2);
variancia_SQ = SQ/(n - 2);
Syy = sum((y - mean(y)).^2);
r2 = 1 - (SQ/Syy);
display(r2)
%====
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
%==========
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
plot(x,ychap,'g-')
%plot(x,ychap2,'*')
%plot(x,ychap3,'*')
%plot(x,ychap4,'*')
plot(x,ychap5,'*')
%plot(x,g3)
%plot(x,g4)
%plot(x,g5)