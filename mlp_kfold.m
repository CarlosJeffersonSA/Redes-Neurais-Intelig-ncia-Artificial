base = importdata('iris_log.dat');

%treino
X1 = base([16:150],1:4)';
X2 = base([1:15,31:150],1:4)';
X3 = base([1:30,46:150],1:4)';
X4 = base([1:45,61:150],1:4)';
X5 = base([1:60,76:150],1:4)';
X6 = base([1:75,91:150],1:4)';
X7 = base([1:90,106:150],1:4)';
X8 = base([1:105,121:150],1:4)';
X9 = base([1:120,136:150],1:4)';
X10 = base([1:135],1:4)';

X1 = [ones(1,135)*(-1);X1];
X2 = [ones(1,135)*(-1);X2];
X3 = [ones(1,135)*(-1);X3];
X4 = [ones(1,135)*(-1);X4];
X5 = [ones(1,135)*(-1);X5];
X6 = [ones(1,135)*(-1);X6];
X7 = [ones(1,135)*(-1);X7];
X8 = [ones(1,135)*(-1);X8];
X9 = [ones(1,135)*(-1);X9];
X10 = [ones(1,135)*(-1);X10];

D1 = base([16:150],5:7)';
D2 = base([1:15,31:150],5:7)';
D3 = base([1:30,46:150],5:7)';
D4 = base([1:45,61:150],5:7)';
D5 = base([1:60,76:150],5:7)';
D6 = base([1:75,91:150],5:7)';
D7 = base([1:90,106:150],5:7)';
D8 = base([1:105,121:150],5:7)';
D9 = base([1:120,136:150],5:7)';
D10 = base([1:135],5:7)';

%===========================X1============================
%função para execução do backpropagation X1
net1 = patternnet(3); %qtd de camadas ocultas
net1.trainParam.epochs = 15; %qtd de épocas
net1 = train(net1,X1,D1);
y1 = net1(X1);
perf = perform(net1,D1,y1);
classes = vec2ind(y1);

%teste X1
xt1 = base([1:15],1:4)';
xt1 = [ones(1,15);xt1];
dt1 = base([1:15],5:7)';

%função para execução do backpropagation para base de testes X1
net1 = patternnet(3);
net1.trainParam.epochs = 15;
net1 = train(net1,xt1,dt1);
yt1 = net1(X1);
perf_teste1 = perform(net1,D1,y1);
classes_teste1 = vec2ind(y1);

cont = 0;
%comparando resultados
for i = 1:15
    [c, e] = max(y1(:, i));
    [f, g] = max(yt1(:, i));
    if e==g
        cont=cont+1;
    end
end
acc1 = cont/15

%=========================X2==============================
%função para execução do backpropagation X2
net2 = patternnet(3); %qtd de camadas ocultas
net2.trainParam.epochs = 15; %qtd de épocas
net2 = train(net2,X2,D2);
y2 = net2(X2);
perf = perform(net2,D2,y2);
classes = vec2ind(y2);

%teste X1
xt2 = base([16:30],1:4)';
xt2 = [ones(1,15);xt2];
dt2 = base([16:30],5:7)';

%função para execução do backpropagation para base de testes X2
net2 = patternnet(3);
net2.trainParam.epochs = 15;
net2 = train(net2,xt2,dt2);
yt2 = net2(X2);
perf_teste2 = perform(net2,D2,y2);
classes_teste2 = vec2ind(y2);

cont2 = 0;
%comparando resultados
for i = 1:15
    [c, e] = max(y2(:, i));
    [f, g] = max(yt2(:, i));
    if e==g
        cont2=cont2+1;
    end
end
acc2 = cont2/15

%=========================X3==============================
%função para execução do backpropagation X3
net3 = patternnet(3); %qtd de camadas ocultas
net3.trainParam.epochs = 15; %qtd de épocas
net3 = train(net3,X3,D3);
y3 = net3(X3);
perf = perform(net3,D3,y3);
classes = vec2ind(y3);

%teste X3
xt3 = base([31:45],1:4)'; 
xt3 = [ones(1,15);xt3];
dt3 = base([31:45],5:7)';

%função para execução do backpropagation para base de testes X3
net3 = patternnet(3);
net3.trainParam.epochs = 15;
net3 = train(net3,xt3,dt3);
yt3 = net3(X3);
perf_teste3 = perform(net3,D3,y3);
classes_teste3 = vec2ind(y3);

cont3 = 0;
%comparando resultados
for i = 1:15
    [c, e] = max(y3(:, i));
    [f, g] = max(yt3(:, i));
    if e==g
        cont3=cont3+1;
    end
end
acc3 = cont3/15

%=========================X4==============================
%função para execução do backpropagation X4
net4 = patternnet(3); %qtd de camadas ocultas
net4.trainParam.epochs = 15; %qtd de épocas
net4 = train(net4,X4,D4);
y4 = net4(X4);
perf4 = perform(net4,D4,y4);
classes4 = vec2ind(y4);

%teste X4
xt4 = base([46:60],1:4)';
xt4 = [ones(1,15);xt4];
dt4 = base([46:60],5:7)';

%função para execução do backpropagation para base de testes X4
net4 = patternnet(3);
net4.trainParam.epochs = 15;
net4 = train(net4,xt4,dt4);
yt4 = net4(X4);
perf_teste4 = perform(net4,D4,y4);
classes_teste4 = vec2ind(y4);

cont4 = 0;
%comparando resultados
for i = 1:15
    [c, e] = max(y4(:, i));
    [f, g] = max(yt4(:, i));
    if e==g
        cont4=cont4+1;
    end
end
acc4 = cont4/15

%=========================X5==============================
%função para execução do backpropagation X5
net5 = patternnet(3); %qtd de camadas ocultas
net5.trainParam.epochs = 15; %qtd de épocas
net5 = train(net5,X5,D5);
y5 = net5(X5);
perf = perform(net5,D5,y5);
classes = vec2ind(y5);

%teste X1
xt5 = base([61:75],1:4)';
xt5 = [ones(1,15);xt5];
dt5 = base([61:75],5:7)';

%função para execução do backpropagation para base de testes X5
net5 = patternnet(3);
net5.trainParam.epochs = 15;
net5 = train(net5,xt5,dt5);
yt5 = net5(X5);
perf_teste5 = perform(net5,D5,y5);
classes_teste5 = vec2ind(y5);

cont5 = 0;
%comparando resultados
for i = 1:15
    [c, e] = max(y5(:, i));
    [f, g] = max(yt5(:, i));
    if e==g
        cont5=cont5+1;
    end
end
acc5 = cont5/15

%=========================X6==============================
%função para execução do backpropagation X6
net6 = patternnet(3); %qtd de camadas ocultas
net6.trainParam.epochs = 15; %qtd de épocas
net6 = train(net6,X6,D6);
y6 = net6(X6);
perf = perform(net6,D6,y6);
classes = vec2ind(y6);

%teste X6
xt6 = base([76:90],1:4)';
xt6 = [ones(1,15);xt6];
dt6 = base([76:90],5:7)';

%função para execução do backpropagation para base de testes X6
net6 = patternnet(3);
net6.trainParam.epochs = 15;
net6 = train(net6,xt6,dt6);
yt6 = net6(X6);
perf_teste6 = perform(net6,D6,y6);
classes_teste6 = vec2ind(y6);

cont6 = 0;
%comparando resultados
for i = 1:15
    [c, e] = max(y6(:, i));
    [f, g] = max(yt6(:, i));
    if e==g
        cont6=cont6+1;
    end
end
acc6 = cont6/15

%=========================X7==============================
%função para execução do backpropagation X7
net7 = patternnet(3); %qtd de camadas ocultas
net7.trainParam.epochs = 15; %qtd de épocas
net7 = train(net7,X7,D7);
y7 = net7(X7);
perf = perform(net7,D7,y7);
classes = vec2ind(y7);

%teste X7
xt7 = base([91:105],1:4)';
xt7 = [ones(1,15);xt7];
dt7 = base([91:105],5:7)';

%função para execução do backpropagation para base de testes X7
net7 = patternnet(3);
net7.trainParam.epochs = 15;
net7 = train(net7,xt7,dt7);
yt7 = net7(X7);
perf_teste7 = perform(net7,D7,y7);
classes_teste7 = vec2ind(y7);

cont7 = 0;
%comparando resultados
for i = 1:15
    [c, e] = max(y7(:, i));
    [f, g] = max(yt7(:, i));
    if e==g
        cont7=cont7+1;
    end
end
acc7 = cont7/15

%=========================X8==============================
%função para execução do backpropagation X8
net8 = patternnet(3); %qtd de camadas ocultas
net8.trainParam.epochs = 15; %qtd de épocas
net8 = train(net8,X8,D8);
y8 = net8(X8);
perf = perform(net8,D8,y8);
classes = vec2ind(y8);

%teste X8
xt8 = base([106:120],1:4)';
xt8 = [ones(1,15);xt8];
dt8 = base([106:120],5:7)';

%função para execução do backpropagation para base de testes X8
net8 = patternnet(3);
net8.trainParam.epochs = 15;
net8 = train(net8,xt8,dt8);
yt8 = net8(X8);
perf_teste8 = perform(net8,D8,y8);
classes_teste8 = vec2ind(y8);

cont8 = 0;
%comparando resultados
for i = 1:15
    [c, e] = max(y8(:, i));
    [f, g] = max(yt8(:, i));
    if e==g
        cont8=cont8+1;
    end
end
acc8 = cont8/15

%=========================X9==============================
%função para execução do backpropagation X9
net9 = patternnet(3); %qtd de camadas ocultas
net9.trainParam.epochs = 15; %qtd de épocas
net9 = train(net9,X9,D9);
y9 = net9(X9);
perf = perform(net9,D9,y9);
classes = vec2ind(y9);

%teste X9
xt9 = base([121:135],1:4)';
xt9 = [ones(1,15);xt9];
dt9 = base([121:135],5:7)';

%função para execução do backpropagation para base de testes X9
net9 = patternnet(3);
net9.trainParam.epochs = 15;
net9 = train(net9,xt9,dt9);
yt9 = net9(X9);
perf_teste = perform(net9,D9,y9);
classes_teste = vec2ind(y9);

cont9 = 0;
%comparando resultados
for i = 1:15
    [c, e] = max(y9(:, i));
    [f, g] = max(yt9(:, i));
    if e==g
        cont9=cont9+1;
    end
end
acc9 = cont9/15

%=========================X10==============================
%função para execução do backpropagation X1
net10 = patternnet(3); %qtd de camadas ocultas
net10.trainParam.epochs = 15; %qtd de épocas
net10 = train(net10,X10,D10);
y10 = net10(X10);
perf = perform(net10,D10,y10);
classes = vec2ind(y10);

%teste X10
xt10 = base([136:150],1:4)';
xt10 = [ones(1,15);xt10];
dt10 = base([136:150],5:7)';

%função para execução do backpropagation para base de testes X1
net10 = patternnet(3);
net10.trainParam.epochs = 15;
net10 = train(net10,xt10,dt10);
yt10 = net10(X10);
perf_teste10 = perform(net10,D10,y10);
classes_teste10 = vec2ind(y10);

cont10 = 0;
%comparando resultados
for i = 1:15
    [c, e] = max(y10(:, i));
    [f, g] = max(yt10(:, i));
    if e==g
        cont10=cont10+1;
    end
end
acc10 = cont10/15

acc_final = (acc1 + acc2 + acc3 + acc4 + acc5 + acc6 + acc7 + acc8 + acc9 + acc10)/10
