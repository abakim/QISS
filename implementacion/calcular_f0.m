function [f0] = calcular_f0(ventana, fm)
%% F0 por correlacion
cor = xcorr(ventana);  % aplico autocorrelacion
[pico, pos_pico] = max(cor);  % pico junto con su posicion
cor_positiva = cor(pos_pico:end);

[picos,pos_picos] = findpeaks(cor_positiva);
maximo = picos(1); 
maximo_pos = pos_picos(1);  % calculo todo los picos sin contar el 1ro
  
 for i=2:length(picos)
     if picos(i) > maximo
         maximo = picos(i);
         maximo_pos = pos_picos(i);
     end
 end  % calculo el mayor de todos
  
%calculo f0
t0 = maximo_pos/fm;
f0 = 1/t0;

end

