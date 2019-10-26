base = importdata('iris_log.dat');

%treino
x = base(:,1:4)'; %Entradas, 70% para treino 
d = base(:,5:7)';
x = [ones(1,150)*(-1);x];

%função para execução do backpropagation
net = patternnet(4); %qtd de camadas ocultas
net.trainParam.epochs = 5; %qtd de épocas
net = train(net,x,d);
y = net(x);
perf = perform(net,d,y);
classes = vec2ind(y);

cont=0; %Conta a quantidade de acertos
for i=1:1:150
%teste
x_teste = base(i,1:4)'; %realizando os mesmos passos anteriores para uma entrada de 30%, para testes
x_teste = [ones(1,1);x_teste];
d_teste = base(i,5:7)';

%função para execução do backpropagation para base de testes
net = patternnet(4);
net.trainParam.epochs = 5;
net = train(net,x_teste,d_teste);
y_teste = net(x);
perf_teste = perform(net,d,y);
classes_teste = vec2ind(y);


%comparando resultados

    [c, e] = max(d(:, i));
    [f, g] = max(y_teste(:, i));
    if e==g
        cont=cont+1;
    end
end

acuracia = cont/150;
disp(acuracia)