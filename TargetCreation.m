%Target: 10x750 
%Data: 256x750

target=eye(10);
targetFinal=[];
testTarget=[];
%Treino
for i=1:75
    targetFinal=horzcat(targetFinal,target);
end

%Teste
for i=1:5
    testTarget=horzcat(testTarget,target);
end

% Target da Matriz Perfeita (para a Memória Associativa) 

load('PerfectArial');
perfData=[];
for i=1:75
    perfData=horzcat(perfData,Perfect);
end

filename='perfData.mat';
filename2='targetFinal.mat';
save(filename,'perfData')
save(filename2,'targetFinal')
save('testTarget','testTarget')


