function [caracteristica_d, caracteristica_c] = vector_caracteristico(matriz_ventanas,chats,charlas,fm)
ALPHA = 300;

%% Se agregan la f0
cantidad = size(chats,1); %cuantas charlas hay
for i=1:cantidad %catidad de charlas detectadas
    f0acum = 0;
    distancia = chats(i,2) - chats(i,1); %Cantidad de ventanas en la charla
    cont = chats(i,1);
    suma = 0;
    for j=1:distancia
        ventana = matriz_ventanas(cont,:);
        f0 = calcular_f0(ventana, fm);
        if (f0 < 300 && f0 > 50) 
            f0acum = f0acum+f0;
            suma = suma + 1;
            f0_m_todas(i,j) = f0;
        else
            f0_m_todas(i,j) = 0;
        end
        cont = cont+1;
    end
    f0acum = f0acum/suma;
    caracteristica_a(i,1) = f0acum/ALPHA;   % se divide por un alfa para bajar los valores
end

%% Se agrega las bandas de frecuencia
bandas = bandafrecuencia(charlas, fm);

for i=1:size(bandas,1)
     caracteristica_b(i,:) = horzcat(caracteristica_a(i,:),bandas(i,:));
end


%% Se agregan los coeficientes LPC

c_lpc = calcular_lpc(matriz_ventanas,chats);

for i=1:size(charlas,1)
     caracteristica_c(i,:) = horzcat(caracteristica_b(i,:),c_lpc(i,:));
end

%% Se eliminan lo NaN
nan_m = isnan(caracteristica_c);  % matriz para detectar nan

cont = 1;
for i=1:size(nan_m(:,1))    % recorre la fila de f0
    if (nan_m(i,1) ~= 1)    % si f0 no es NaN
        caracteristica_d(cont,:) = caracteristica_c(i,:);   % guardo todo el vector
        cont = cont +1;
    end
end
