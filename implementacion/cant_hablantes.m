function [cant_hablantes, cant_generos] = cant_hablantes(caracteristica,tol)
cant_hablantes = 0; %al menos alguien va a estar hablando
[caracteristica_h, caracteristica_m] = genero(caracteristica);
Qm=zeros(1,16);
Qh=zeros(1,16);
cant_hablantesh=0;
cant_hablantesm=0;
if sum(caracteristica_h(1,:)) ~=0
    Qh = diccionario(caracteristica_h,tol,1);
    cant_hablantesh = cant_hablantesh + size(Qh,1);
end
if sum(caracteristica_m(1,:)) ~=0
    Qm = diccionario(caracteristica_m,tol,1);
    cant_hablantesm = cant_hablantesm + size(Qm,1);
end

cant_generos(1,1) = 1;
cant_generos(2,1) = 2;
cant_generos(1,2) = cant_hablantesh;
cant_generos(2,2) = cant_hablantesm;

cant_hablantes = cant_hablantesh + cant_hablantesm;

end

