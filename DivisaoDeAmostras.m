%Separando 80% dasamostras para treino e para teste aleatoriamente. 
%120 amostras para treino e 30 teste.



load iris_log.dat;

Teste = ones(30,7);

    for i=1:30 
       posicao = randi (151-i,1);
       Teste(i,:) = iris_log (posicao,:);
       iris_log (posicao,:) = [];
    end
    
Treino = iris_log;
Entradas = ones (120, 4);
Classes = ones (120,3);

for i=1:7
    if i<5
        Entradas (:,i) = Treino (:,i);
    else
        Classes (:,i-4) = Treino (:,i);
    end
end

InputTreino = [Treino(:,1) Treino(:,2) Treino(:,3) Treino(:,4)]';
ClassesTreino = [Treino(:,5) Treino(:,6) Treino(:,7)]';

InputTeste = [Teste(:,1) Teste(:,2) Teste(:,3) Teste(:,4)]';
ClasseTeste = [Teste(:,5) Teste(:,6) Teste(:,7)]';