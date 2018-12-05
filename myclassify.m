function output= myclassify(data,filled)


choice=menu('Classificador a utilizar?' ,'Associative Memory com Hardlim',' Associative Memory com Linear','Associative Memory com Logsig','Só Hardlim','Só Linear','Só Logsig') ;

if choice == 1
    load('hardlimMem.mat');
    
elseif choice ==2
    load('linearMem.mat');
    
elseif choice == 3
    load('logsigMem.mat');

elseif choice ==4 
       load('hardlim.mat');

elseif choice ==5
    load('linear.mat');
    
elseif choice == 6
    load('logsig.mat');
   
end

results=net(data);
[x,y]=max(results);
output=int64(y(filled));
    
end
