base = importdata('iris_log.dat');
%método k-fold
%para cada etapa do k-fold foi repetido os mesmos processos
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

sig = 0.1;
p = 4;
q = 1;
W = sig*randn(q,p+1);


X1 = [ones(1,135);X1];
X2 = [ones(1,135);X2];
X3 = [ones(1,135);X3];
X4 = [ones(1,135);X4];
X5 = [ones(1,135);X5];
X6 = [ones(1,135);X6];
X7 = [ones(1,135);X7];
X8 = [ones(1,135);X8];
X9 = [ones(1,135);X9];
X10 = [ones(1,135);X10];

%função de ativação
u1 = W*X1;
Z1 = 1./(1.+exp(-u1));
Z1 = [ones(1,135);Z1];
M1 = D1*Z1'*((Z1*Z1')^(-1));

%função de ativação
u2 = W*X2;
Z2 = 1./(1.+exp(-u2));
Z2 = [ones(1,135);Z2];
M2 = D2*Z2'*((Z2*Z2')^(-1));

%função de ativação
u3 = W*X3;
Z3 = 1./(1.+exp(-u3));
Z3 = [ones(1,135);Z3];
M3 = D3*Z3'*((Z3*Z3')^(-1));

%função de ativação
u4 = W*X4;
Z4 = 1./(1.+exp(-u4));
Z4 = [ones(1,135);Z4];
M4 = D4*Z4'*((Z4*Z4')^(-1));

%função de ativação
u5 = W*X5;
Z5 = 1./(1.+exp(-u5));
Z5 = [ones(1,135);Z5];
M5 = D5*Z5'*((Z5*Z5')^(-1));

%função de ativação
u6 = W*X6;
Z6 = 1./(1.+exp(-u6));
Z6 = [ones(1,135);Z6];
M6 = D6*Z6'*((Z6*Z6')^(-1));

%função de ativação
u7 = W*X7;
Z7 = 1./(1.+exp(-u7));
Z7 = [ones(1,135);Z7];
M7 = D7*Z7'*((Z7*Z7')^(-1));

%função de ativação
u8 = W*X8;
Z8 = 1./(1.+exp(-u8));
Z8 = [ones(1,135);Z8];
M8 = D8*Z8'*((Z8*Z8')^(-1));

%função de ativação
u9 = W*X9;
Z9 = 1./(1.+exp(-u9));
Z9 = [ones(1,135);Z9];
M9 = D9*Z9'*((Z9*Z9')^(-1));

%função de ativação
u10 = W*X10;
Z10 = 1./(1.+exp(-u10));
Z10 = [ones(1,135);Z10];
M10 = D10*Z10'*((Z10*Z10')^(-1));


%teste k1
X_t1 = base([1:15],1:4)';
X_t1 = [ones(1,15);X_t1];
Z_t1 = W*X_t1;
Z_t1 = 1./(1.+exp(-Z_t1));
Z_t1 = [ones(1,15);Z_t1];
D_t1 = M1*Z_t1;

%teste k2
X_t2 = base([16:30],1:4)';
X_t2 = [ones(1,15);X_t2];
Z_t2 = W*X_t2;
Z_t2 = 1./(1.+exp(-Z_t2));
Z_t2 = [ones(1,15);Z_t2];
D_t2 = M2*Z_t2;

%teste k3
X_t3 = base([31:45],1:4)';
X_t3 = [ones(1,15);X_t3];
Z_t3 = W*X_t3;
Z_t3 = 1./(1.+exp(-Z_t3));
Z_t3 = [ones(1,15);Z_t3];
D_t3 = M3*Z_t3;

%teste k4
X_t4 = base([46:60],1:4)';
X_t4 = [ones(1,15);X_t4];
Z_t4 = W*X_t4;
Z_t4 = 1./(1.+exp(-Z_t4));
Z_t4 = [ones(1,15);Z_t4];
D_t4 = M4*Z_t4;

%teste k5
X_t5 = base([61:75],1:4)';
X_t5 = [ones(1,15);X_t5];
Z_t5 = W*X_t5;
Z_t5 = 1./(1.+exp(-Z_t5));
Z_t5 = [ones(1,15);Z_t5];
D_t5 = M5*Z_t5;

%teste k6
X_t6 = base([76:90],1:4)';
X_t6 = [ones(1,15);X_t6];
Z_t6 = W*X_t6;
Z_t6 = 1./(1.+exp(-Z_t6));
Z_t6 = [ones(1,15);Z_t6];
D_t6 = M6*Z_t6;

%teste k7
X_t7 = base([91:105],1:4)';
X_t7 = [ones(1,15);X_t7];
Z_t7 = W*X_t7;
Z_t7 = 1./(1.+exp(-Z_t7));
Z_t7 = [ones(1,15);Z_t7];
D_t7 = M7*Z_t7;

%teste k8
X_t8 = base([106:120],1:4)';
X_t8 = [ones(1,15);X_t8];
Z_t8 = W*X_t8;
Z_t8 = 1./(1.+exp(-Z_t8));
Z_t8 = [ones(1,15);Z_t8];
D_t8 = M8*Z_t8;

%teste k9
X_t9 = base([121:135],1:4)';
X_t9 = [ones(1,15);X_t9];
Z_t9 = W*X_t9;
Z_t9 = 1./(1.+exp(-Z_t9));
Z_t9 = [ones(1,15);Z_t9];
D_t9 = M9*Z_t9;

%teste k10
X_t10 = base([136:150],1:4)';
X_t10 = [ones(1,15);X_t10];
Z_t10 = W*X_t10;
Z_t10 = 1./(1.+exp(-Z_t10));
Z_t10 = [ones(1,15);Z_t10];
D_t10 = M10*Z_t10;

%acurácia acc1
cont1=0;
for i=1:15
    [a1 b1] = max(D1(:,i));
    [c1 d1] = max(D_t1(:,i));
    if b1==d1
        cont1 = cont1+1;
    end
end
acc1 = cont1/15;

%acurácia acc2
cont2=0;
for i=1:15
    [a2 b2] = max(D2(:,i));
    [c2 d2] = max(D_t2(:,i));
    if b2==d2
        cont2 = cont2+1;
    end
end
acc2 = cont2/15;

%acurácia acc3
cont3=0;
for i=1:15
    [a3 b3] = max(D3(:,i));
    [c3 d3] = max(D_t3(:,i));
    if b3==d3
        cont3 = cont3+1;
    end
end
acc3 = cont3/15;

%acurácia acc4
cont4=0;
for i=1:15
    [a4 b4] = max(D4(:,i));
    [c4 d4] = max(D_t4(:,i));
    if b4==d4
        cont4 = cont4+1;
    end
end
acc4 = cont4/15;

%acurácia acc5
cont5=0;
for i=1:15
    [a5 b5] = max(D5(:,i));
    [c5 d5] = max(D_t5(:,i));
    if b5==d5
        cont5 = cont5+1;
    end
end
acc5 = cont5/15;

%acurácia acc6
cont6=0;
for i=1:15
    [a6 b6] = max(D6(:,i));
    [c6 d6] = max(D_t6(:,i));
    if b6==d6
        cont6 = cont6+1;
    end
end
acc6 = cont6/15;

%acurácia acc7
cont7=0;
for i=1:15
    [a7 b7] = max(D7(:,i));
    [c7 d7] = max(D_t7(:,i));
    if b7==d7
        cont7 = cont7+1;
    end
end
acc7 = cont7/15;

%acurácia acc1
cont8=0;
for i=1:15
    [a8 b8] = max(D8(:,i));
    [c8 d8] = max(D_t8(:,i));
    if b8==d8
        cont8 = cont8+1;
    end
end
acc8 = cont8/15;

%acurácia acc1
cont9=0;
for i=1:15
    [a9 b9] = max(D9(:,i));
    [c9 d9] = max(D_t9(:,i));
    if b9==d9
        cont9 = cont9+1;
    end
end
acc9 = cont9/15;

%acurácia acc1
cont10=0;
for i=1:15
    [a10 b10] = max(D10(:,i));
    [c10 d10] = max(D_t10(:,i));
    if b10==d10
        cont10 = cont10+1;
    end
end
acc10 = cont10/15;

kfold = (acc1 + acc2 + acc3 + acc4 + acc5 + acc6 + acc7 + acc8 + acc9 + acc10)/10;
disp(kfold);%acurácia do método kfold


