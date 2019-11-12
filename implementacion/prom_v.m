function [suma] = prom_v(A,B)
%promedio entre dos vectores
largo = size(A,2);
suma = 0;
for i=1:largo
    aux = A(i)+B(i);
    suma(i) = aux/largo;
end

end

