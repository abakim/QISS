function [T] = tabla_caracteristicas(caracteristica)
%% tabla
frases = cell(1,size(caracteristica,1));
for i=1:size(caracteristica,1)
%     num2str(i)
%     strcat('frase ',num2str(i))
    frases{i} = strcat('frase ',num2str(i));
end

F0 = caracteristica(:,1);
B100_250 = caracteristica(:,2);
B250_500 = caracteristica(:,3);
B500_750 = caracteristica(:,4);
B750_1000 = caracteristica(:,5);
B1000_1500 = caracteristica(:,6);
B1500_2000 = caracteristica(:,7);
B2000_3000 = caracteristica(:,8);
LPC_C1 = caracteristica(:,9);
LPC_C2 = caracteristica(:,10);
LPC_C3 = caracteristica(:,11);
LPC_C4 = caracteristica(:,12);
LPC_C5 = caracteristica(:,13);
LPC_C6 = caracteristica(:,14);
LPC_C7 = caracteristica(:,15);
LPC_C8 = caracteristica(:,16);

T = table(F0,B100_250,B250_500,B500_750,B750_1000,B1000_1500,B1500_2000,B2000_3000,LPC_C1,LPC_C2,LPC_C3,LPC_C4,LPC_C5,LPC_C6,LPC_C7,LPC_C8,'RowNames',frases);
end

