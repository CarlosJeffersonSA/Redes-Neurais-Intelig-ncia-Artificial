clear;
%==========================
%   |ALGORITMO GENÉTICO|
%==========================
%população inicial
p_inicial = randi([0,1], 20,20);

%iteração das gerações
for geracoes = 1:100
%fitness
for i = 1:20
        %Conversão binário para decimal com fins de testes(fitness)
        x(i) = (20*bin2dec(num2str(p_inicial(i, 1:10))))/1023;
        y(i) = (20*bin2dec(num2str(p_inicial(i, 11:20))))/1023;
        z(i) = abs(x(i)*sin(y(i)*(pi/4)) + y(i)*sin(x(i)*(pi/4)));
        p_iteracao(i,:)= [p_inicial(i, 1:10), p_inicial(i, 11:20), x(i), y(i), z(i)];
        p_iteracao = sortrows(p_iteracao, 23, 'descend');
end
%seleção de indivíduos
SelecionaIndividuos = [p_iteracao(1:10, :); p_iteracao(1:10, :)];
%crossover
for i = 1:5
    %pares aleatórios
    a1 = randi([1,10]);
    a2 = randi([1,10]);
    a3 = randi([11,20]);
    a4 = randi([11,20]);
    cross = SelecionaIndividuos(i, a1);
    SelecionaIndividuos(i, a1) = SelecionaIndividuos(i+5, a2);
    SelecionaIndividuos(i+5, a2) = cross;
    b = SelecionaIndividuos(i, a3);
    SelecionaIndividuos(i, a3) = SelecionaIndividuos(i+5, a4);
    SelecionaIndividuos(i+5, a4) = b;
end
%nova população
p_inicial = SelecionaIndividuos(1:20,1:20);
end

%função base a ser utilizada
[x,y] = meshgrid(0:0.01:20,0:.01:20);
z = abs(x.*sin(y.*(pi/4)) + y.*sin(x.*(pi/4)));
superficie = surf(x,y,z);
colormap hot
superficie.EdgeColor = 'none';
hold on

%posição das coordenadas no vetor. Posições 1x21, 1x22, 1x23
x = p_iteracao(1, 21);
y = p_iteracao(1, 22);
z = p_iteracao(1, 23);

plot3(x,y,z, 'ok', 'MarkerSize', 15, 'MarkerFaceColor', 'b')
txt = ['Coordenadas'];
txt1 = ['x= ', num2str(x)];
txt2 = ['y= ', num2str(y)];
txt3 = ['z= ', num2str(z)];
text(x,y,(z + 10),txt);
text(x,y,(z + 7), txt1);
text(x,y,(z + 4), txt2);
text(x,y,(z + 1), txt3);
hold off