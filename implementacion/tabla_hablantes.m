function [TF] = tabla_hablantes(cantidad, matriz_genero)
generos = {'Hombres','Mujeres','Total'};
Cantidades = matriz_genero(:,2);
Cantidades(3) = cantidad;

TF = table(Cantidades,'RowNames',generos);

end

