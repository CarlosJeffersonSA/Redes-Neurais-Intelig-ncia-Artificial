base = importdata('iris_log.dat');

%treino
x = base([1:21,31:51,61:81,91:111,121:141],1:4)'; %Entradas, 70% para treino 
d = base([1:21,31:51,61:81,91:111,121:141],5:7)';
x = [ones(1,105)*(-1);x];

%função para execução do backpropagation
net = patternnet(3); %qtd de camadas ocultas
net.trainParam.epochs = 15; %qtd de épocas
net = train(net,x,d);
y = net(x);
perf = perform(net,d,y);
classes = vec2ind(y);

%teste
x_teste = base([22:30,52:60,82:90,112:120,142:150],1:4)'; %realizando os mesmos passos anteriores para uma entrada de 30%, para testes
x_teste = [ones(1,45);x_teste];
d_teste = base([22:30,52:60,82:90,112:120,142:150],5:7)';

%função para execução do backpropagation para base de testes
net = patternnet(3);
net.trainParam.epochs = 15;
net = train(net,x_teste,d_teste);
y_teste = net(x);
perf_teste = perform(net,d,y);
classes_teste = vec2ind(y);

cont = 0;
%comparando resultados
for i = 1:45
    [c, e] = max(y(:, i));
    [f, g] = max(y_teste(:, i));
    if e==g
        cont=cont+1;
    end
end

acuracia = cont/45;
disp(acuracia)