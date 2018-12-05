function NeuralCreation()

%Criar target
run('TargetCreation.m')

%Loads dos dados
load('perfData.mat');
load('targetFinal.mat');
load('numbersData4.mat');
load('test.mat')
load('testTarget.mat')

%Memória Associativa
weight = perfData*pinv(matrizFinal1);
numbersDataAM=weight*matrizFinal1;
P=weight*P;

%GUI
choice1 = menu('Memoria Associativa?','Sim','Nao');
switch choice1
    case 1
        m_fun = numbersDataAM;
        name_1 = 'Mem';
    case 2
        m_fun = P;
        name_1 = '';
end
    
choice2 = menu('Função de activação?','Hardlim','Sigmoidal','Linear');
switch choice2
    case 1
        a_fun = 'hardlim';
    case 2
        a_fun = 'logsig';
    case 3
        a_fun = 'purelin';
end

choice3 = menu('Learning method?','Gradient rule','Gradient rule improved with momentum','Hebb Rule','Hebb rule with decaying weight','Widrow-Hoff learning rule');
switch choice3
    case 1
        l_fun = 'learngd';
    case 2
        l_fun = 'learngdm';
    case 3
        l_fun = 'learnh';
    case 4
        l_fun = 'learnhd'
    case 5
        l_fun = 'learnwh'
end

%criar network com os parametros
net = newp(repmat([0 1],[256 1]),10, a_fun , l_fun );

%Pesos e a Bias
W=rand(10,256);
b=rand(10,1);
net.IW{1,1}=W;
net.b{1,1}=b;

%Learning Rates 
net.performParam.lr=0.5;
net.trainParam.epochs =500;
net.trainParam.show =35;
net.trainParam.goal =1e-6;

% Divisão 80% treino 10% teste e 10% validacão, modo aleatório
net.performFcn ='sse';
net.divideFcn = 'dividerand';        
net.divideMode = 'sample';            
net.divideParam.trainRatio = 80/100;
net.divideParam.valRatio = 10/100;
net.divideParam.testRatio = 10/100;

%Treino
[net,tr]=train(net,numbersDataAM,targetFinal);

%Outputs treino
outputs = net(numbersDataAM);
errors = gsubtract(outputs,targetFinal);
performance = perform(net,targetFinal,outputs);

%Outputs teste
outputs2=sim(net,P)

%calculo da acuracia
sprintf('Accuracy Treino em %')
acuracia(outputs,targetFinal)*100
sprintf('Accuracy Teste em %')
acuracia(outputs2,testTarget)*100

neuralNet = net;

%saves
filename = strcat(a_fun,name_1);
save(filename)

     
end
