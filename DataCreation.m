%Criar dados com recurso ás matrize P

load('P1.mat')
load('P2.mat')
load('P3.mat')
load('P4.mat')
load('P5.mat')
load('P6.mat')
load('P7.mat')
load('P8.mat')
load('P9.mat')
load('P10.mat')
load('P11.mat')
load('P12.mat')
load('P13.mat')
load('P14.mat')
load('P15.mat')

%matrizFinal = [P1 P2 P3 P4 P5 P6 P7 P8 P9 P10]
matrizFinal1 = [P1 P2 P3 P4 P5 P6 P7 P8 P9 P10 P11 P12 P13 P14 P15];

save('dadosFinal.mat' , 'matrizFinal1');