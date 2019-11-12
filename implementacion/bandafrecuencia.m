function [bandas_frase] = bandafrecuencia(charlas,fm)
cantidad = size(charlas,1); %cuantas charlas hay
for i=1:cantidad %catidad de charlas detectadas
    p_fft=abs(fft(charlas(i)));
    p = bandpower(charlas(i,:),fm,[100,250]);
    bandas_frase(i,1) = p;
    p = bandpower(charlas(i,:),fm,[250,500]);
    bandas_frase(i,2) = p;
    p = bandpower(charlas(i,:),fm,[500,750]);
    bandas_frase(i,3) = p;
    p = bandpower(charlas(i,:),fm,[750,1000]);
    bandas_frase(i,4) = p;
    p = bandpower(charlas(i,:),fm,[1000,1500]);
    bandas_frase(i,5) = p;
    p = bandpower(charlas(i,:),fm,[1500,2000]);
    bandas_frase(i,6) = p;
    p = bandpower(charlas(i,:),fm,[2000,3000]);
    bandas_frase(i,7) = p;
end
%bandas_frase = bandas_frase*1000;

bandas_frase = log10(bandas_frase)/4;
end

