clear;
base = importdata('iris_log.dat');%base de dados
%==========================
%   |ALGORITMO RBF - iris_log|
%==========================
%Inicializando as variáveis.
Acc = 0;
Total = 0;
Min = 0;
Max = 0;

%Repetição de 50 vezes como é requerido no trabalho
for j = 1 : 50
    % Treino - 80% dos valores
    Data = zeros(120,7);
    %Selecionando de forma aleatória os valores de treino e alocando esses valores no vetor 'Data'
    for i = 1 : 120
        aux = randi(151-i,1);
        Data(i,:) = base(aux,:);
    end
    
    X = Data(:,1:4)'; % Entrada
    D = Data(:,5:7)'; % Saída
    
    pesos = zeros(1,120); %pesos
%=============================================================%    
    %neurônio 1
    for i = 1 : 120
        aux = randi(121-i, 1);
        pesos(i) = base(aux,1)';
    end
    %Função Gaussiana
    train = zeros(1,120);
    for i = 1 : 120
        train(1,i) = norm(X(1,i) - pesos(i));
    end
    neuronio1 = exp(-train.^2);
%=============================================================%     
    % Neurônio 2
    for i = 1 : 120
        aux = randi(121-i, 1);
        pesos(i) = base(aux,2)';
    end
    %Função Gaussiana
    train2 = zeros(1,120);
    for i = 1 : 120
        train2(1,i) = norm(X(2,i) - pesos(i));
    end
    neuronio2 = exp(-train2.^2);
%=============================================================%     
    %Neurônio 3
    for i = 1 : 120
        aux = randi(121-i, 1);
        pesos(i) = base(aux,3)';
    end
    %Função Gaussiana
    train3 = zeros(1,120);
    for i = 1 : 120
        train3(1,i) = norm(X(3,i) - pesos(i));
    end
    neuronio3 = exp(-train3.^2);
%=============================================================%     
    %Neurônio 4
    for i = 1 : 120
        aux = randi(121-i, 1);
        pesos(i) = base(aux,4)';
    end
    train4 = zeros(1,120);
    %Função Gaussiana
    for i = 1 : 120
        train4(1,i) = norm(X(4,i) - pesos(i));
    end
    neuronio4 = exp(-train4.^2);
%=============================================================%     
    %Função de ativação da rede
    Z = [neuronio1;neuronio2;neuronio3;neuronio4];
    Z = [ones(1,120);Z]; %Bias
    
    M = D*Z'*(Z*Z')^(-1);
%=============================================================% 
    
    %Teste de 20% dos dados
    Data_test = zeros(30,7);
    
    for i = 1 : 30
        aux = randi(151-i,1);
        Data_test(i,:) = base(aux,:);
    end
    X_teste = Data_test(:,1:4)';

%=============================================================%     
    % Neurônio 1 - Teste         
    for i = 1 : 30
        aux = randi(31-i, 1);
        pesos(i) = base(aux,1)';
    end
    
    %Função Gaussiana
    teste1 = zeros(1,30);
    for i = 1 : 30
        teste1(1,i) = norm(X_teste(1,i) - pesos(i));
    end
    neuron_teste1 = exp(-teste1.^2);
%=============================================================%     
    % Neurônio 2 - Teste
    for i = 1 : 30
        aux = randi(31-i, 1);
        pesos(i) = base(aux,2)';
    end
 
    %Função Gaussiana
    teste2 = zeros(1,30);
    for i = 1 : 30
        teste2(1,i) = norm(X_teste(2,i) - pesos(i));
    end
    neuron_teste2 = exp(-teste2.^2);
%=============================================================%     
    % Neurônio 3 - Teste
    for i = 1 : 30
        aux = randi(31-i, 1);
        pesos(i) = base(aux,3)';
    end
    
    %Função Gaussiana
    teste3 = zeros(1,30);
    for i = 1 : 30
        teste3(1,i) = norm(X_teste(3,i) - pesos(i));
    end
    
    neuron_teste3 = exp(-teste3.^2);
%=============================================================%     
    % Neurônio 4 - Teste
    for i = 1 : 30
        aux = randi(31-i, 1);
        pesos(i) = base(aux,4)';
    end
    
    %Função Gaussiana
    teste4 = zeros(1,30);
    for i = 1 : 30
        teste4(1,i) = norm(X_teste(4,i) - pesos(i));
    end
    
    neuron_teste4 = exp(-teste4.^2); 
%=============================================================%     
    %Função de ativação da Rede Neural
    Z_teste = [neuron_teste1;neuron_teste2;neuron_teste3;neuron_teste4];
    Z_teste = [ones(1,30);Z_teste];
    
    D_teste = M*Z_teste;
    
    % Calculando a acurácia da Rede Neural.
    cont = 0;
    for i = 1:30
        [a, b] = max(D(:, i));
        [c, d] = max(D_teste(:, i));
        if b==d
            cont=cont+1;
        end
    end
        
    Acc = cont/30;
    Total = Total + Acc;
     
    if j == 1
        Min = Acc;
        Max = Acc;
    end
    
    if Acc < Min
        Min = Acc;
    elseif Acc > Max
        Max = Acc;
    end
end

Acertos = (Total/50)*100;

fprintf('Média de Acertos: %.2f%%\n',Acertos);
fprintf('Valor Maximo: %.2f%%\n',Max*100);
fprintf('Valor Minimo = %.2f%%\n',Min*100);