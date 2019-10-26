x = 0:0.01:20;
y = 0:0.01:20;
z = abs(x.*sin(y.*(pi/4)) + y.*sin(x.*(pi/4)));
%tomar um número aleatório dos vetores x e y
x1 = x(randi(numel(x)));
y1 = y(randi(numel(y)));

while(x1<=20 && x1>=0 && y1<=20 && y1>=0)

%vizinhos

v1 = abs(x1.*sin(y1.*(pi/4)) + y1.*sin(x1.*(pi/4)));
v2 = abs((x1+0.01).*sin(y1.*(pi/4)) + y1.*sin((x1+0.01).*(pi/4)));
v3 = abs(x1.*sin((y1+0.01).*(pi/4)) + (y1+0.01).*sin(x1.*(pi/4)));
v4 = abs((x1-0.01).*sin(y1.*(pi/4)) + y1.*sin((x1-0.01).*(pi/4)));
v5 = abs(x1.*sin((y1-0.01).*(pi/4)) + (y1-0.01).*sin(x1.*(pi/4)));
v6 = abs((x1+0.01).*sin((y1+0.01).*(pi/4)) + (y1+0.01).*sin((x1+0.01).*(pi/4)));
v7 = abs((x1-0.01).*sin((y1-0.01).*(pi/4)) + (y1-0.01).*sin((x1-0.01).*(pi/4)));
v8 = abs((x1+0.01).*sin((y1-0.01).*(pi/4)) + (y1-0.01).*sin((x1+0.01).*(pi/4)));
v9 = abs((x1-0.01).*sin((y1+0.01).*(pi/4)) + (y1+0.01).*sin((x1-0.01).*(pi/4)));
vet = [v1, v2, v3, v4, v5, v6, v7, v8];%vetor com os valores da função relativo a cada vizinho
max_vet =  max(vet);%variável que retorna vetor com resultado de maior valor da função

%testes para a subida da encosta
if (max_vet==v1)
    
    fsurf(@(x,y) abs(x.*sin(y.*(pi/4)) + y.*sin(x.*(pi/4))),[0 20]);%plot da função em todo o intervalo
    title('Função - Questão 1')
    xlabel('x');
    ylabel('y');
    zlabel('z');
    box on
    
    hold on
    %mostra a posição do valor resultado da função Hill Climbing
    [~,i] = max(v1(:));
    h = scatter3(x1(i),y1(i),v1(i),'o','MarkerFaceColor','r');
    h.SizeData = 200;
    hold off
	disp(max_vet);
	break
elseif (max_vet==v2)
    x1 = x1+0.01;
elseif (max_vet==v3)
    y1 = y1+0.01;
elseif (max_vet==v4)
    x1 = x1-0.01;
elseif (max_vet==v5)
    y1= y1-0.01;
elseif (max_vet==v6)
    x1 = x1+0.01;
    y1 = y1+0.01;
elseif (max_vet==v7)
    x1 = x1-0.01;
    y1 = y1-0.01;
elseif (max_vet==v8)
    x1 = x1+0.01;
    y1 = y1-0.01;
elseif (max_vet==v9)
    x1 = x1-0.01;
    y1 = y1+0.01;
end
end