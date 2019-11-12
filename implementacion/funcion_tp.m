function [] = funcion_tp(ruta_archivo)
[msenial fm] = audioread(ruta_archivo); %leyendo el archivo y su frecuencia de sampleo
%% Promediado de canales de la señal
if (size(msenial,2) == 2)
        senial = msenial(:,2);
else
    senial = msenial;
end

%% Atributos
segs=(length(senial))/fm;%44100
long_senial = length(senial);

maximo = max(senial(1:fm/2));   % maxima amplitud del tramo donde hay ruido
tol = 10;    % tolerancia de ruido
umbral = maximo*tol;

%% Ventaneo de la senial %%

tam_ventana = floor(0.03*fm);  % tamano de la ventana
v_to = (1: tam_ventana : long_senial);  % creo los tramos, de long de la senal muestra (ya que N=S*fm)
v_to_long = length(v_to);   % determino cantidad de tramos (ventanas) en total

for i=1:v_to_long-1 % recorre por ventana
    cont=1;
    for o=v_to(i):(v_to(i)+tam_ventana) %recorre dentro de cada ventana
        aux(cont)=senial(o);
        cont=cont+1;
    end
    matriz_ventanas(i,:)=(aux);  % guardamos en una matriz cada una
end                              % de las divisiones de mi senial original

for i=1 : v_to_long-1  % se recorre por ventana
    v_max(i)=max(matriz_ventanas(i,:));  % amplitud maxima de cada tramo  de la senal
end

%% Deteccion de las charlas %%
fila = 1;
i=1;
while (i<v_to_long-1)
    if v_max(i)>umbral %cuando encontramos el inicio de alguien hablando
        inicio = i; %guardamos la pos inicial de la charla
        cont  = i;
        while (v_max(cont)>umbral && cont<v_to_long-1) %mientras nos mantengamos en la charla
             cont = cont + 1;    % aumento de posicion de ventana   
        end
        final = cont; %encuentro el final de la charla
        chats(fila,1) = inicio;
        chats(fila,2) = final; %guardo el inicio y final de cada charla en una fila de una matriz
        i = final;
        fila = fila + 1;
    else
        i=i+1;
    end
    
end

%% Se eliminan conversaciones con menos de 7 ventanas

cont = 1;
for i=1:size(chats,1)  % se recorre por todas las charlas detectadas
    if(chats(i,2)-chats(i,1)>= 7)   % si la cantidad de ventanas es mayor a 7
        chats2(cont,:) = chats(i,:);    % se crea un nuevo chat
        cont = cont+1;
    end
end
chats = chats2;
%% Charlas

cantidad = size(chats,1);  % cantidad de charlas
for i=1:cantidad  % catidad de charlas detectadas
    cont=1;
    for j=chats(i,1):chats(i,2)  % de 33 a 82 en el caso ed la primer charla
        for k=1:length(matriz_ventanas)
            charlas(i,cont) = matriz_ventanas(j,k);
            cont = cont + 1;
        end
    end
end
%% Vector caracteristico
[caracteristica, ~] = vector_caracteristico(matriz_ventanas,chats,charlas,fm);

%% llamadas a funciones finales
%tabla de caracteristicas por charla
T = tabla_caracteristicas(caracteristica)
%grafico caracteristicas por charla
graficacion(ruta_archivo,senial,caracteristica);
%tabla de cantidad de hablantes por generos y total
%[cantidad, matriz_genero] = cant_hablantes(caracteristica,18) % para el metodo 0
[cantidad, matriz_genero] = cant_hablantes(caracteristica,0.18); % para el metodo 1 0.18  // 0.30
% !!! dos mujeres con 0.18 anda bien
TF = tabla_hablantes(cantidad, matriz_genero)
caracteristica;
%dist=abs(KLDiv(caracteristica(1,:),caracteristica(2,:)));
chats*0.03;

end


