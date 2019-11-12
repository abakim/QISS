function [ caracteristica_h, caracteristica_m] = genero( caracteristica )

for k=1:size(caracteristica(:,1))
    f0(k) = caracteristica(k,1);
end

% cont_m = 1;
% cont_h = 1;
% for i=1:size(caracteristica,1)
%      caracteristica_m(cont_m,:) = zeros(1,size(caracteristica,2));
%      cont_m = cont_m +1;
%      caracteristica_h(cont_h,:) = zeros(1,size(caracteristica,2));
%      cont_h = cont_h +1;
% end

caracteristica_m = zeros(1,16); % para que no de error 
caracteristica_h = zeros(1,16);

cont_m = 1;
cont_h = 1;
for i=1:size(f0,2)
    if(f0(i)*300>200)
        caracteristica_m(cont_m,:) = caracteristica(i,:);
        cont_m = cont_m +1;
    else
        caracteristica_h(cont_h,:) = caracteristica(i,:);
        cont_h = cont_h +1;
    end
end

%% elimino zeros
% cont_m = 1;
% cont_h = 1;
% for i=1:size(caracteristica_m,1)
%      if (sum(caracteristica_m(cont_m,:)) ~= 0)
%          caracteristica_m2(cont_m,:) = caracteristica_m(i,:);
%          cont_m = cont_m +1;
%      else
%          caracteristica_m2 = caracteristica_m;
%      end
% end
% for i=1:size(caracteristica_h,1)
%      if (sum(caracteristica_h(cont_h,:)) ~= 0)
%          caracteristica_h2(cont_h,:) = caracteristica_h(i,:);
%          cont_h = cont_h+1;
%      else
%          caracteristica_h2 = caracteristica_h;
%      end
% end

end