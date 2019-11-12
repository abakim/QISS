function [c_lpc] = calcular_lpc(matriz_ventanas,chats)

%sin ventanear
% for i=1:size(charlas,1)
%         c_lpc(i,:) = lpc(charlas(i,:),8); %usamos 8 coeficientes
% end

%con ventaneo
cantidad = size(chats,1);  % cantidad de charlas
for i=1:cantidad 
    fila = 1;
    for j=chats(i,1):chats(i,2)  % lpc de ventanas de una frase
        c_lpc_frase(fila,:) = lpc(matriz_ventanas(j,:),8);
        fila = fila +1;
    end
    size(c_lpc_frase);
    col = 1;
    for k=1:size(c_lpc_frase,2)
        c_lpc(i,col) = median(c_lpc_frase(:,k)); %utilizacion de la mediana
        col = col +1;
    end
 
end
c_lpc = c_lpc(:,2:end);

% maximo1 = max(c_lpc(:,1))
%  size(c_lpc,2)
%  size(c_lpc,1)
for i=1:size(c_lpc,2) %  me muevo de a coeficientes
    maximo = max(abs(c_lpc(:,i))); %el maximo del coeficiente Ci
    for j=1:size(c_lpc,1)  %por cada cada coeficiente, me muevo por frase
        c_lpc(j,i) = c_lpc(j,i)/maximo;
    end
end
%c_lpc
        

end

