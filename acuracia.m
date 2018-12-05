%Função para comparar o output da rede com os targets e calcular a acuracy
%(Acertos/Total)

function res = acuracia(Test_Set,Target_Set)

    j=0;
    
    for i=1:size(Test_Set,2)
        if Test_Set(:,i) == Target_Set(:,i)
            j = j+1;
        end
    end
    
    res = j/size(Test_Set,2);
    
end