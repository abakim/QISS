function [] = graficacion(ruta_archivo,senial,caracteristica)
    %grafico la seÃ±al
    figure('name',ruta_archivo);
    plot(senial);
    title('Señal de audio de la frase');
    grid();
    xlabel('tiempo');
    ylabel('amplitud');
    %grafico las caracteristicas
    figure('name',ruta_archivo)
    %surf(caracteristica)
    imagesc(caracteristica)
    colorbar;
    title('Vectores de caracteristicas por frase detectada');
    xlabel('Caracteristicas'); 
    ylabel('Charlas');
    set(gca,'Ytick',1:1:size(caracteristica,1));
end

