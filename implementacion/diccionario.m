function [Q] = diccionario(caracteristica,tol,metodo) %se calculan la cantidad de hablantes
                                               % de cada grupo de hablantes
                                               %hombre-mujer
%% metodo uno: uso del producto punto
if metodo == 0
    Q = zeros(1,16);
    aux = zeros(1,16);
    M = caracteristica;
    cont = 2;
    Q(1,:) = M(1,:);
    punto = 100;
    for i=2 : size(M,1)  % recorro por cantidad de frases
        entro = 0;
        for  j=1 : size(Q,1)  % recorro por la cantidad de hablantes ya detectados
            flag = size(Q,1);
            if i~=j 
                punto = dot(Q(j,:),M(i,:));  %probamos calculando el parecido
                    if punto < tol           %si es parecido, promediamos
                        aux(1,:) = Q(j,:);
                        Q(j,:) = prom_v(aux,M(i,:));
                        a = prom_v(aux,M(i,:));
                        break
                    else  %si no es parecido, lo agregamos a la base Q
                        entro = entro+1;
                        %entro
                        %flag
                        if entro==flag  %se comprueba si no se encontro 
                                        %ningun Q parecido, de ser asi se agrega
                            Q(cont,:) = M(i,:);
                            cont = cont+1;
                        end
                    end
            end
        end
    end
else if metodo == 1
%% metodo dos: uso del metodo de divergencia de Kullback-Leibler
    Q = zeros(1,16);
    aux = zeros(1,16);
    M = caracteristica;
    cont = 2;
    Q(1,:) = M(1,:);
    if size(M,1) ~= 1
        for i=2 : size(M,1)  % recorro por cantidad de frases
            entro = 0;
            for  j=1 : size(Q,1)  % recorro por la cantidad de hablantes ya detectados
                flag = size(Q,1);
                if i~=j 
                    dist=abs(KLDiv(M(i,:),Q(j,:))); %punto = dot(Q(j,:),M(i,:));  %probamos calculando el parecido
                        if dist < tol           %si es parecido, promediamos
                            aux(1,:) = Q(j,:);
                            Q(j,:) = prom_v(aux,M(i,:));
                            a = prom_v(aux,M(i,:));
                            break
                        else  %si no es parecido, lo agregamos a la base Q
                            entro = entro+1;
                            %entro
                            %flag
                            if entro==flag  %se comprueba si no se encontro 
                                            %ningun Q parecido, de ser asi se agrega
                                Q(cont,:) = M(i,:);
                                cont = cont+1;
                            end
                        end
                end
            end
        end
    end
end
end
end

